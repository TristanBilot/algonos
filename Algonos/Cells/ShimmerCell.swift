//
//  ShimmerCell.swift
//  Algonos
//
//  Created by Tristan Bilot on 08/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import UIKit

class ShimmerCell: UITableViewCell {
    
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var lineView1: UIView!
    @IBOutlet weak var lineView2: UIView!
    
    var modeColor: UIColor?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        initStyle()
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        initStyle()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.initStyle()
    }
    
    private func initStyle() {
        if UIViewController().traitCollection.userInterfaceStyle == .dark {
            self.modeColor = UIColor.red
        }
        else {
            self.modeColor = UIColor.greenSea
        }
        self.squareView.backgroundColor = self.modeColor
        self.lineView1.backgroundColor = modeColor
        self.lineView2.backgroundColor = modeColor
    }
}
