//
//  TestTableViewCell.swift
//  Algonos
//
//  Created by Tristan Bilot on 12/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    static let cellIdentifier = "categoryCell"
    
    var category: Category?
    let progressRingBuilder = ProgressRingBuilder()
    
    var alreadyLoaded: Bool = false

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var progressBarView: CircularProgressBar!
    
    func initCell(category: Category) {
        self.categoryLabel.text = category.name
        self.category = category
        if let img = category.image { self.img.image = img }
        
        initStyle()
//        progressRingBuilder.initProgressRing(
//            progressBar: progressBarView,
//            safePercent: category.percentage,
//            animation: !alreadyLoaded
//        )
    }
  
    func initStyle() {
        progressBarView.backgroundColor = UIColor.clear
        
        progressBarView.isHidden = true
    }
    
    
}
