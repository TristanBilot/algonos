//
//  CoursePresenter.swift
//  Algonos
//
//  Created by Tristan Bilot on 09/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

class CoursePresenter: CoursePresentable {
    var viewController: CourseViewController?
    
    init(vc: CourseViewController) {
        self.viewController = vc
    }
}
