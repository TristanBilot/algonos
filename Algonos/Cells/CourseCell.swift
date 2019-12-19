//
//  TestCategoryTableViewCell.swift
//  Algonos
//
//  Created by Tristan Bilot on 13/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {
    static let cellIdentifier = "CourseCell"
    
    @IBOutlet weak var containerView: UIButton!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var progressionLabel: UILabel!
  
    var course: Course?
    var controller: CourseListViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initStyle()
    }
    
    func initStyle() {
        self.courseLabel.text = course?.title
        self.containerView.layer.cornerRadius = 10
    }
    
    func initCell(controller: CourseListViewController, course: Course) {
        self.courseLabel.text = course.title
        self.course = course
        self.progressionLabel.text = "0"
        self.controller = controller
    }
    
    @IBAction func tapOnCell(_ sender: Any) {
      /* impossible to perform a segue from a cell so using the parent controller to next view */
        controller?.selectedCourse = course
        controller?.performSegue(withIdentifier: "categoryToCourse", sender: controller)
    }
    
}
