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
    
    let progressRingBuilder = ProgressRingBuilder()
    var course: Course?
    var controller: CourseListViewController?
    
    var alreadyLoaded: Bool = false
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var courseLabel: UILabel!
    @IBOutlet weak var progressBarView: CircularProgressBar!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initStyle()
    }
    
    func initStyle() {
        self.progressBarView.backgroundColor = UIColor.clear
        self.courseLabel.text = course?.title
        self.containerView.layer.cornerRadius = 10
        
        progressBarView.isHidden = true
    }
  
    func initCell(controller: CourseListViewController, course: Course) {
        self.courseLabel.text = course.title
        self.course = course
        self.controller = controller
//        progressRingBuilder.initProgressRing(
//            progressBar: progressBarView,
//            safePercent: course.percentage ?? "0",
//            animation: !alreadyLoaded
//        )
        alreadyLoaded = true
    }
    
}
