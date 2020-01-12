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
        loadContent()
    }
    
    func loadContent() {
        CourseRequest().fetchWithId(course?._id) { json in
            self.course?.content = Content(json: json)
            self.presenter.presentText((self.course?.content!.text)!)
            self.presenter.presentImage((self.course?.content!.code)!)
            self.presenter.presentComplexity((self.course?.content!.complexity)!)
        }
    }
}
