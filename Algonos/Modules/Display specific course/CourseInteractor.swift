//
//  CourseInteractor.swift
//  Algonos
//
//  Created by Tristan Bilot on 09/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

class CourseInteractor {
    var presenter: CoursePresentable
    
    var course: Course?
    
    init(presenter: CoursePresentable, course: Course?) {
        self.presenter = presenter
        self.course = course
    }
    
    func loadContent() {
        CourseRequest().fetchWithId(course?._id) { [weak self] json in
         
         
        }
    }
}
