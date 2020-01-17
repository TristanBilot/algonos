//
//  File.swift
//  Algonos
//
//  Created by Tristan Bilot on 1/17/20.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import UIKit

class ComplexityView: UIView {
  var complexity: Complexity?
  
  let nibHeight: CGFloat = 120.0
  let nibColor: UIColor = UIColor.systemGray5
  let nibRadius: CGFloat = 10
  
  @IBOutlet weak var titlesStackView: UIStackView!
  @IBOutlet weak var complexitiesStackView: UIStackView!
  
  // MARK: - Nib init
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  }
  
  class func instanceFromNib() -> ComplexityView {
    return UINib(nibName: "ComplexityView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! ComplexityView
  }
  
  // MARK: - Style init
  func formatConstraints() {
    self.heightAnchor.constraint(equalToConstant: nibHeight).isActive = true
  }
  
  func initStyle() {
    backgroundColor    = nibColor
    layer.cornerRadius = nibRadius
  }
  
  func initComplexity(complexity: Complexity) {
    self.complexity = complexity
    fillComplexitiesStackView()
    fillTitlesStackView()
    
    formatConstraints()
    initStyle()
  }
  
  private func fillTitlesStackView() {
    let subviews = titlesStackView.arrangedSubviews
    let complexityLevels = ["Worst", "Average", "Best"]
    (subviews[0] as? UILabel)?.text = complexityLevels[0]
    (subviews[1] as? UILabel)?.text = complexityLevels[1]
    (subviews[2] as? UILabel)?.text = complexityLevels[2]
  }
  
  private func fillComplexitiesStackView() {
    let subviews = complexitiesStackView.arrangedSubviews
    (subviews[0] as? UILabel)?.text = complexity?.worst
    (subviews[1] as? UILabel)?.text = complexity?.average
    (subviews[2] as? UILabel)?.text = complexity?.best
  }
}
