//
//  CoursePresenter.swift
//  Algonos
//
//  Created by Tristan Bilot on 09/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import UIKit
import SwiftyJSON

class CoursePresenter: CoursePresentable {
    var viewController: CourseViewController?
    var course: Course?
    
    init(vc: CourseViewController, course: Course?) {
        self.viewController = vc
        self.course = course
        presentElements()
    }
    
    func presentElements() {
      course?.elements.forEach({ (view) in
        viewController?.addElement(view)
      })
    }

}
