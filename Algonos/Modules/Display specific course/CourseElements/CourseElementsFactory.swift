//
//  CourseElementsFactory.swift
//  Algonos
//
//  Created by Tristan Bilot on 1/17/20.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import UIKit

class CourseElementsFactory {
  
  //MARK: - Elements building
  func label(text: String) -> UILabel {
      let label = UILabel()
      label.numberOfLines = 0
      label.text = text
      label.textColor = UIColor.label
      label.addInterlineSpacing(spacingValue: 3)
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
  }
  
  func image(url: String) -> UIImageView? {
      let image = UIImage().downloadImage(from: url)
      let imageView = UIImageView(image: image)
      imageView.contentMode = .scaleAspectFit
      imageView.translatesAutoresizingMaskIntoConstraints = false
      reduiceHeightOfImage(imageView)
      return imageView
  }
  
  func complexity(complexity: Complexity) -> ComplexityView? {
    let customView = ComplexityView.instanceFromNib()
    customView.initComplexity(complexity: complexity)
    customView.translatesAutoresizingMaskIntoConstraints = false
    return customView
  }
  
  func title(text: String) -> UILabel {
    let label = UILabel()
    label.numberOfLines = 0
    label.text = text
    label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }
  
  //MARK: - Utils
  private func reduiceHeightOfImage(_ imageView: UIImageView) {
    /* We need to reduice the height of the imageView because we don't
     want to put a static height. So this code reduice the height
     based on the number of bytes of image. More the image is big,
     more we need to reduice its height
     */
    let bytes = imageView.image?.pngData()?.count ?? 0
    let imageHeight = imageView.image?.size.height ?? 0
    var constraintDivisor: CGFloat = 2.0
    
    if bytes > 130000 {
      constraintDivisor = 3.0
    }
    
    if bytes > 120000 {
      constraintDivisor = 2.5
    }
    
    if bytes > 60000 {
      constraintDivisor = 2.3
    }
    
    let perfectHeight = imageHeight / constraintDivisor
    imageView.heightAnchor.constraint(equalToConstant: perfectHeight).isActive = true
  }
}
