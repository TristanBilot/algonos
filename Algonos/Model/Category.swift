//
//  Category.swift
//  Algonos
//
//  Created by Tristan on 12/19/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation
import SwiftyJSON

class Category: Model {
  var _id: String?
  var name: String?
  var difficulty: String?
  var image: UIImage?
  var json: JSON
  
  required init(_ json: JSON) {
    self.json = json
    loadData()
  }
  
  func loadData() {
      if json.count == 0 { return }
      _id = json["_id"].string
      name = json["name"].string
      difficulty = json["difficulty"].string
      image = UIImage().downloadImage(from: json["image"].string!)
  }
}
