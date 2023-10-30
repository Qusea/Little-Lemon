//
//  Menu.swift
//  Little Lemon
//
//  Created by Qusea Saif on 10/29/23.
//

import SwiftUI

struct Menu: View {
  var body: some View {
    VStack {
      Text("Little Lemon")
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(Color("DarkGreen"))
        .padding(.bottom, 20)
      Text("Chicago")
        .font(.subheadline)
        .foregroundColor(Color("DarkGreen"))
        .padding(.bottom, 20)
      Text(
        "Little Lemon is a restaurant that serves healthy food. We are located in Chicago and we are open from 8am to 10pm every day."
      )
      .font(.subheadline)
      .foregroundColor(Color("DarkGreen"))
      .padding(.bottom, 20)
      List {

      }
    }
  }
}

#Preview {
  Menu()
}
