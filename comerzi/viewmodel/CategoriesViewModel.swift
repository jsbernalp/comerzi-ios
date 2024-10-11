//
//  TestViewModel.swift
//  comerzi
//
//  Created by Jonathan Steven Bernal Perilla on 7/10/24.
//

import Foundation
import Factory
import SwiftUI

class CategoriesViewModel: ObservableObject {
    @Injected(\.repository) private var repository
    @Published var categories: [Category] = []
    
    init() {
        categories = repository.fetchAllCategories()
    }
    
    func saveCategory(categoryName: String) {
        if isExistCategory(withName: categoryName) { return }
        let category = Category(name: categoryName.uppercased())
        categories.insert(category, at: 0)
        repository.encodeAndSaveAllCategories(categories: categories)
    }
    
    func isExistCategory(withName name: String) -> Bool {
        categories.contains(where: { $0.name.uppercased() == name.uppercased() })
    }
    
    func removeCategory(withId id: String) {
        categories.removeAll(where: { $0.id == id })
        repository.encodeAndSaveAllCategories(categories: categories)
    }
}
