//
//  MenuCategory.swift
//  Little Lemon
//
//  Created by Qusea Saif on 2/10/23.
//

import Foundation

enum MenuCategory: String, CaseIterable, Codable, Hashable, Identifiable {
    case starters
    case mains
    case desserts

    var id: String { self.rawValue }
}
