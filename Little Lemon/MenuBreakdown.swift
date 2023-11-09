//
//  MenuBreakdown.swift
//  Little Lemon
//
//  Created by Qusea Saif on 11/6/23.
//

import SwiftUI

struct MenuBreakdown: View {
    @Binding var selection: Set<String>

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                Text("Filter:")
                    .fontWeight(.bold)
                ForEach(MenuCategory.allCases, id: \.id) { category in
                    CategorySelector(selection: $selection, category: category)
                }
            }
        }
        .padding()
    }
}

struct CategorySelector: View {
    @Binding var selection: Set<String>
    @State var isSelected: Bool = false
    var category: MenuCategory

    var body: some View {
        Button {
            withAnimation {
                isSelected.toggle()
            }
            if isSelected {
                selection.insert(category.rawValue)
                print("insert \(category.rawValue)")
                print("set after insert = \(selection)")
            } else {
                selection.remove(category.rawValue)
                print("remove \(category.rawValue)")
                print("set after remove = \(selection)")
            }
        } label: {
            Text(category.rawValue)
                .fontWeight(.bold)
                .foregroundStyle(isSelected ? Color.white : Color.feldgrau)
        }
        .padding(7)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(isSelected ? Color.feldgrau : Color.gray.opacity(0.3))
        )
    }
}
