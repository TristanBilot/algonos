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
        guard let content = self.course?.content else { return }
        self.presenter.presentText(content[0]!.text!)
        self.presenter.presentImage(content[0]!.code!)
        self.presenter.presentComplexity(content[0]!.complexity!)
    }
}
