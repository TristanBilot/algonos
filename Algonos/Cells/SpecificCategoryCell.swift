//
//  TestCategoryTableViewCell.swift
//  Algonos
//
//  Created by Tristan Bilot on 13/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class SpecificCategoryCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIButton!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var progressionLabel: UILabel!
    
    var controller: CourseListViewController?
    var courseId: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initStyle()
    }
    
    func initStyle() {
        self.containerView.layer.cornerRadius = 10
    }
    
    func initCell(controller: UIViewController?, category: String?, progression: String?) {
        self.categoryLabel?.text = category
        self.progressionLabel?.text = progression
    }
    
    @IBAction func tapOnCell(_ sender: Any) {
        controller?.selectedCategory = categoryLabel.text
        controller?.selectedCourseId = courseId
        controller?.performSegue(withIdentifier: "categoryToSpecifiedItem", sender: controller)
    }
    
}
