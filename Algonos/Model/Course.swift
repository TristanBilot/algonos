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
            
        case "label": return factory.label(text: json[key].string!)
        case "image": return factory.image(url: json[key].string!)
        case "complexity": return factory.complexity(complexity: Complexity(json: json[key])!)
        case "title": return factory.title(text: json[key].string!)
        case "tableView": return factory.tableView(dictionnary: jsonToDictionnary(json[key].dictionary!))
            
        default: return nil
        }
    }
    
    private func jsonToDictionnary(_ dic: Dictionary<String, JSON>) -> Dictionary<String, String> {
        let dict = dic.mapValues { (json) -> String in
            return json.string!
        }
        return dict
    }
}
