//
//  CoursesInteractor.swift
//  Algonos
//
//  Created by Tristan Bilot on 05/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

class CoursesInteractor {
    var presenter: CoursesPresentable
    
    var courses: [Course] = []
    var category: Category?
    
    init(presenter: CoursesPresentable, category: Category?) {
        self.presenter = presenter
        self.category = category
        loadTableView()
    }
    
    func loadTableView() {
        CourseRequest().fetchWithCategoryId(category?._id) { [weak self] json in
            if json.count == 0 { return }
            for i in 0..<json.count {
                self?.courses.append(Course(json[i]))
            }
            self?.presenter.reloadTableView()
            self?.presenter.hideSkeleton()
        }
    }
}
