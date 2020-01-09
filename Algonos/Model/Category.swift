//
//  Category.swift
//  Algonos
//
//  Created by Tristan on 12/19/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import SwiftyJSON

class Category: Model {
    var _id: String?
    var name: String?
    var image: UIImage?
    var percentage: String
    var json: JSON
    var request = CategoryRequest()
    
    required init(_ json: JSON) {
        self.json = json
        self.percentage = "0"
        loadData()
    }
    
    required init(json: JSON, percentage: String) {
        self.json = json
        self.percentage = percentage
        loadData()
    }
    
    func loadData() {
        if json.count == 0 { return }
        _id = json["_id"].string
        name = json["name"].string
        image = UIImage().downloadImage(from: json["image"].string!)
    }
    
    func fetchPercentage(_ completion: @escaping (String) -> Void) {
        request.fetchPercentagesForCategory(categoryId: _id) { [weak self] json in
            if json.count == 0 { return }
            print(json["totalPercentage"].string!)
            guard let percentage = json["totalPercentage"].string else {
                self?.percentage = "0"
                return
            }
            self?.percentage = percentage
            completion(percentage)
        }
    }
}
