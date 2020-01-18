//
//  ComplexityTableViewCell.swift
//  Algonos
//
//  Created by Tristan Bilot on 18/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import UIKit

class ComplexityTableViewCell: UITableViewCell {
    static let cellIdentifier = "ComplexityTableViewCell"
    let nibHeight: CGFloat = 40.0
    
    @IBOutlet weak var column1: UILabel!
    @IBOutlet weak var column2: UILabel!
    
    // MARK: - Nib init
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    class func instanceFromNib() -> ComplexityTableViewCell {
        return UINib(nibName: cellIdentifier, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ComplexityTableViewCell
    }
    
    // MARK: - Style init
    func formatConstraints() {
        self.heightAnchor.constraint(equalToConstant: nibHeight).isActive = true
    }
    
    func initComplexity(column1: String, column2: String) {
        self.column1.text = column1
        self.column2.text = column2
        
        formatConstraints()
    }
}
