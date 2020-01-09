//
//  CategoriesPresenter.swift
//  Algonos
//
//  Created by Tristan Bilot on 04/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import UIKit

class CategoriesPresenter: CategoriesPresentable {
    var viewController: CategoriesViewController
    
    init(vc: CategoriesViewController) {
        self.viewController = vc
    }
    
    func reloadTableView() {
        viewController.tableView.reloadData()
    }
    
    func hideSkeleton() {
        viewController.view.hideSkeleton()
    }
}
