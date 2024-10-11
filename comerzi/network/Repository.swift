//
//  Repository.swift
//  comerzi
//
//  Created by Jonathan Steven Bernal Perilla on 7/10/24.
//

import Foundation

class Repository {
    
    func encodeAndSaveAllCategories(categories: [Category]) {
        if let encoded = try? JSONEncoder().encode(categories) {
            UserDefaults.standard.set(encoded, forKey: "categories")
        }
    }
    
    func fetchAllCategories() -> [Category] {
        if let decoded = UserDefaults.standard.object(forKey: "categories") as? Data {
           if let categories = try? JSONDecoder().decode([Category].self, from: decoded){
                return categories
            }
        }
        return []
    }
    
    
}
