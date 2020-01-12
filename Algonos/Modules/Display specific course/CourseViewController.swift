//
//  CategoryViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 13/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit
import SkeletonView

class CourseViewController: UIViewController {
    var interactor: CourseInteractor?
    
    var course: Course?
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var codeImageView: UIImageView!
    @IBOutlet weak var complexityLevelStackView: UIStackView!
    @IBOutlet weak var complexityValueStackView: UIStackView!
    @IBOutlet weak var stackViewsContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItemTitle()
        setup()
        initStyle()
    }
    
    //MARK: - Setup functions
    func setup() {
        let presenter = CoursePresenter(vc: self, course: course)
        let interactor = CourseInteractor(presenter: presenter, course: self.course)
        self.interactor = interactor
//        view.hideSkeleton()
    }
    
    func setNavigationItemTitle() {
        self.navigationItem.title = course?.title
    }
    
    func initStyle() {
        stackViewsContainerView.layer.cornerRadius = 10
    }

}
