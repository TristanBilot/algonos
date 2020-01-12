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
    var content: Content?
    var categoryId: String?
    var percentage: String?
    var json: JSON
    
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
//        content = Content(json: json)
    }
}
