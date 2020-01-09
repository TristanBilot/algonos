//
//  CategoryViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 13/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController {
    var interactor: CourseInteractor?
    
    var course: Course?

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItemTitle()
    }
    
    //MARK: - Setup functions
    func setup() {
        let presenter = CoursePresenter(vc: self)
        let interactor = CourseInteractor(presenter: presenter, course: self.course)
        self.interactor = interactor
    }
    
    func setNavigationItemTitle() {
        self.navigationItem.title = course?.title
    }

}
