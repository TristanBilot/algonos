//
//  CourseElementsFactory.swift
//  Algonos
//
//  Created by Tristan Bilot on 1/17/20.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import UIKit

class CourseElementsFactory {
  
  //MARK: - Elements construction
  func label(text: String) -> UILabel {
      let label = UILabel()
      label.numberOfLines = 0
      label.text = text
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
  }
  
  func image(url: String) -> UIImageView {
      let image = UIImage().downloadImage(from: url)
      let imageView = UIImageView(image: image)
      imageView.contentMode = .scaleAspectFit
      imageView.translatesAutoresizingMaskIntoConstraints = false
      /* VALEUR A CHANGER SI JAMAIS BUG SCROLL SUR LA SCROLL VIEW */
      imageView.heightAnchor.constraint(equalToConstant: (image?.size.height)! / 1.8).isActive = true
      return imageView
  }
  
  func complexity(complexity: Complexity) -> ComplexityView? {
//    guard let nib = UINib(nibName: "complexityView", bundle: .main)
//        .instantiate(withOwner: nil, options: nil)[0] as? ComplexityView
//    guard let nib = Bundle.main.loadNibNamed("complexityView", owner: self, options: nil)?[0] as? ComplexityView
//        else { return nil }
//    let nib = ComplexityView.instanceFromNib()
//      nib.initComplexity(complexity: complexity)
//    let view = ComplexityView()
//    let nib = view.instantiateNib()
//    view.initComplexity(complexity: complexity)
    
    let customView = ComplexityView.instanceFromNib()
    customView.initComplexity(complexity: complexity)
    customView.translatesAutoresizingMaskIntoConstraints = false
//    customView.frame = /* add your frame */
//    view.addSubview(customView)
    return customView
  }
}
