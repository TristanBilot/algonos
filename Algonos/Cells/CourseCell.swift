//
//  TestCategoryTableViewCell.swift
//  Algonos
//
//  Created by Tristan Bilot on 13/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit
import UICircularProgressRing

class CourseCell: UITableViewCell {
    static let cellIdentifier = "CourseCell"
    
    @IBOutlet weak var containerView: UIButton!
    @IBOutlet weak var courseLabel: UILabel!
  
    var course: Course?
    var controller: CourseListViewController?
    @IBOutlet weak var progressRingContainer: UIView!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        initStyle()
        initProgressRing()
    }
    
    func initStyle() {
        self.courseLabel.text = course?.title
        self.containerView.layer.cornerRadius = 10
    }
  
  func initProgressRing() {
    let progressRing = UICircularProgressRing()
    progressRing.maxValue = 100
    progressRing.style = .bordered(width: 0.1, color: UIColor.greenSea)
    progressRing.minValue = 0
    progressRing.innerRingWidth = 1
    
    progressRing.outerRingColor = UIColor.flatOrange
    progressRing.outerRingWidth = 1.5
    
    progressRing.frame = CGRect(x: 0 , y: 0, width: self.progressRingContainer.frame.width * 0.5, height: self.progressRingContainer.frame.height)
    //    progressRing.backgroundColor = UIColor.red
    self.progressRingContainer.addSubview(progressRing)
    progressRing.bounds = progressRingContainer.bounds
    progressRing.startProgress(to: 100, duration: 5.0)
  }
  
    func initCell(controller: CourseListViewController, course: Course) {
        self.courseLabel.text = course.title
        self.course = course
        self.controller = controller
    }
    
    @IBAction func tapOnCell(_ sender: Any) {
      /* impossible to perform a segue from a cell so using the parent controller to next view */
        controller?.selectedCourse = course
        controller?.performSegue(withIdentifier: "categoryToCourse", sender: controller)
    }
    
}
