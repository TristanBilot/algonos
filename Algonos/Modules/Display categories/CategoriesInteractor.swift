//
//  CategoriesInteractor.swift
//  Algonos
//
//  Created by Tristan Bilot on 04/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

class CategoriesInteractor {
    var presenter: CategoriesPresentable
    
    var categories: [Category] = []
    
    init(presenter: CategoriesPresentable) {
        self.presenter = presenter
        loadTableView()
    }
    
    // Need refactor fetchPercentage, not optimal
    func loadTableView() {
        CategoryRequest().fetch() { [weak self] json in
            if (json.count == 0) { return }
            var category: Category
            for i in 0..<json.count {
                category = Category(json[i])
                category.fetchPercentage() { (percentage) in
                    self?.categories.append(Category(json: json[i], percentage: percentage))
                    self?.presenter.reloadTableView()
                }
            }
//            self?.presenter.reloadTableView()
            self?.presenter.hideSkeleton()
        }
    }
}
