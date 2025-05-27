//
//  Item.swift
//  SwiftData-Optionals
//
//  Created by Remo Prozzillo on 27.05.2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var id: UUID?
    var name: String?
    
    init(
        id: UUID? = UUID(),
        name: String = ""
        
    ) {
        self.id = id
        self.name = name
    }
}
