//
//  Course.swift
//  Algonos
//
//  Created by Tristan on 12/19/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation
import SwiftyJSON

class Course: Model {
    var _id: String?
    var title: String?
    var elements: [UIView] = []
    var categoryId: String?
    var percentage: String?
    var json: JSON
  
    var factory = CourseElementsFactory()
    
    required init(_ json: JSON) {
        self.json = json
        loadData()
    }
    
    func loadData() {
        if json.count == 0 { return }
        _id = json["_id"].string
        title = json["title"].string
        categoryId = json["categoryId"].string
        percentage = json["percentage"].string

        loadElements()
    }
  
  func loadElements() {
    for i in 0..<json["content"].count {
        guard let element = createElement(json: json["content"][i]) else { break }
        self.elements.append(element)
    }
  }
  
  func createElement(json: JSON) -> UIView? {
    guard let key = json.dictionary?.keys.first else { return nil }
    switch key {
    case "label":
        let lab = factory.label(text: json[key].string!)
        return lab
    case "image":
        let img = factory.image(url: json[key].string!)
        return img
    case "complexity":
      let view = factory.complexity(complexity: Complexity(json: json[key])!)
      return view
    default:
        return nil
    }
  }
}
