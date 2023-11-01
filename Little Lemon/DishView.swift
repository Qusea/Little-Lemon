//
//  DishView.swift
//  Little Lemon
//
//  Created by Qusea Saif on 10/31/23.
//

import SwiftUI

struct DishView: View {
    let dish: Dish

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: dish.image!)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 300)

            HStack {
                Text(dish.title!)
                Spacer()
                Text("$\(dish.price!)")
            }
            .font(.title)
            .padding()

            Text(dish.dishDescription!)
                .font(.body)
                .padding()
            Spacer()
        }
    }
}
