//
//  dependencies.swift
//  comerzi
//
//  Created by Jonathan Steven Bernal Perilla on 7/10/24.
//

import Factory

extension Container{
    var categoriesViewModel: Factory<CategoriesViewModel>{
        Factory(self){ CategoriesViewModel() }
    }
    
    var repository: Factory<Repository>{
        Factory(self){ Repository() }
    }
}
