//
//  Menu.swift
//  Little Lemon
//
//  Created by Qusea Saif on 10/29/23.
//

import CoreData
import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
	@State var selection: Set<String> = []
    @State var searchText = ""

    var body: some View {
        VStack {
			HStack{//}(alignment: .center) {
				Spacer()
                LittleLemonLogo()
                Spacer()
					.overlay {
						Image("profile-image-placeholder")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 40, height: 40)
							.cornerRadius(10)
							.padding(.leading, 20)
					}
            }
            .padding()
			
			HeroView(searchText: $searchText)
			
			MenuBreakdown(selection: $selection)
            
			FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) { (dishes: [Dish]) in
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
                            .frame(width: 50, height: 50)
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
						viewContext.insert(dish)
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

    func buildPredicate() -> NSPredicate {
		if searchText.isEmpty && selection.isEmpty {
            return NSPredicate(value: true)
        }
		
		var predicates: [NSPredicate] = []
		if !searchText.isEmpty {
			predicates.append(NSPredicate(format: "title CONTAINS[cd] %@", searchText))
		}
		if !selection.isEmpty {
			predicates.append(NSPredicate(format: "category IN %@", selection))
		}
		
		
		return NSCompoundPredicate(type: .and, subpredicates: predicates)
    }
}
