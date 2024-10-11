//
//  category.swift
//  comerzi
//
//  Created by Jonathan Steven Bernal Perilla on 8/10/24.
//

import Foundation

struct Category: Codable {
    let id: String
    let name: String
    
    init(id: String = UUID().uuidString, name: String) {
        self.id = id
        self.name = name
    }
}
