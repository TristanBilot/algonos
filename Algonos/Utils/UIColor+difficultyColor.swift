//
//  UIColor+difficultyColor.swift
//  Algonos
//
//  Created by Admin on 12/20/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

extension UIColor {
    static func difficultyColor(_ difficulty: String) -> UIColor {
      switch difficulty {
      case "hard":
        return UIColor.red
      case "medium":
        return UIColor.orange
      case "easy":
        return UIColor.green
      default:
        return UIColor.gray
      }
  }
}
