//
//  CoursePresenter.swift
//  Algonos
//
//  Created by Tristan Bilot on 09/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import UIKit

class CoursePresenter: CoursePresentable {
    var viewController: CourseViewController?
    
    var course: Course?
    
    init(vc: CourseViewController, course: Course?) {
        self.viewController = vc
        self.course = course
    }
    
    func presentText(_ text: String) {
        viewController?.textLabel.text = course?.content?.text
    }
    
    func presentImage(_ image: UIImage) {
        viewController?.codeImageView.image = course?.content?.code
    }
    
    func presentComplexity(_ complexity: Complexity) {
        fillLevelStackView()
        fillValueStackView()
    }
    
    fileprivate func fillLevelStackView() {
        /* first stackView */
        guard let subviews = viewController?.complexityLevelStackView.arrangedSubviews else { return }
        let complexityLevels = ["Worst", "Average", "Best"]
        (subviews[0] as? UILabel)?.text = complexityLevels[0]
        (subviews[1] as? UILabel)?.text = complexityLevels[1]
        (subviews[2] as? UILabel)?.text = complexityLevels[2]
    }
    
    fileprivate func fillValueStackView() {
        /* second stackView */
        guard let subviews = viewController?.complexityValueStackView.arrangedSubviews else { return }
        let complexities = course?.content?.complexity
        (subviews[0] as? UILabel)?.text = complexities?.worst
        (subviews[1] as? UILabel)?.text = complexities?.average
        (subviews[2] as? UILabel)?.text = complexities?.best
    }
}
