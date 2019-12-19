//
//  TestTableViewCell.swift
//  Algonos
//
//  Created by Tristan Bilot on 12/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var score: UILabel!
    var categoryId: String?
    
    func initCell(img: UIImage?, category: String, categoryId: String) {
        self.img.image = img
        initCell(category: category, categoryId: categoryId)
    }
    
    func initCell(category: String, categoryId: String) {
        self.category.text = category
        self.categoryId = categoryId
    }
    
    func initProgressionCircle() {
        let center = self.center
        let shapeLayer = CAShapeLayer()
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.strokeColor = UIColor.orange.cgColor
        shapeLayer.lineWidth = 5
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        shapeLayer.fillColor = UIColor.black.cgColor
        
        shapeLayer.frame.size.width = 3
        shapeLayer.frame.size.height = 3
        
        shapeLayer.path = circularPath.cgPath
        
        self.layer.addSublayer(shapeLayer)
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        shapeLayer.add(animation, forKey: "urSoBasic")
    }
    
}
