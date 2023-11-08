//
//  HeroView.swift
//  Little Lemon
//
//  Created by Qusea Saif on 11/4/23.
//

import SwiftUI

struct HeroView: View {
    @Binding var searchText: String

    var body: some View {
        VStack(alignment: .leading) {
            Text("Little Lemon")
                .font(.title)
                .fontWeight(.bold)
                .foregroundStyle(Color.jonquil)
            HStack {
                VStack(alignment: .leading) {
                    Text("Chicago")
                        .font(.title2)
                        .foregroundStyle(Color.white)
                        .padding(.bottom, 10)
                    Text(
                        "We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist."
                    )
                    .foregroundStyle(Color.white)
                }
                VStack {
                    Spacer()
                    Image("Hero")
                        .resizable()
						.aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }

            TextField("Search", text: $searchText)
                .padding(5)
				.background(Color.white)
				.cornerRadius(10)
        }
        .padding()
        .background(Color.feldgrau)
    }
}
