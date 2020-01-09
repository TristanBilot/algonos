//
//  CoursesPresenter.swift
//  Algonos
//
//  Created by Tristan Bilot on 05/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

class CoursesPresenter: CoursesPresentable {
    var viewController: CourseListViewController
    
    init(vc: CourseListViewController) {
        self.viewController = vc
    }
    
    func reloadTableView() {
        viewController.tableView.reloadData()
    }
    
    func hideSkeleton() {
        viewController.view.hideSkeleton()
    }
}
