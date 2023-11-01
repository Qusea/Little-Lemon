import CoreData
import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        VStack {
            Text("Little Lemon")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 20)
            Text("Chicago")
                .font(.subheadline)
                .padding(.bottom, 20)
            Text(
                "Little Lemon is a restaurant that serves healthy food. We are located in Chicago and we are open from 8am to 10pm every day."
            )
            .font(.subheadline)
            .padding()
            FetchedObjects(sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
                List(dishes) { dish in
                    NavigationLink {
                        DishView(dish: dish)
                    } label: {
                        HStack {
                            Text("\(dish.title!) - $\(dish.price!)")
                            Spacer()
                            AsyncImage(url: URL(string: dish.image!)!) { image in
                                image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 100, height: 100)
                        }
                    }
                }
            }
        }
        .onAppear {
            getMenuData()
        }
    }

    func getMenuData() {
        PersistenceController.shared.clear()
        let serverUrl = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"
        let url = URL(string: serverUrl)!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            if let data = data {
                let decoder = JSONDecoder()
                if let menuList = try? decoder.decode(MenuList.self, from: data) {
                    for item in menuList.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = item.title
                        dish.image = item.image
                        dish.price = item.price
                        dish.category = item.category
                        dish.dishDescription = item.description
                    }

                    try? viewContext.save()
                }
            }
        }
        task.resume()
    }

    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
}
