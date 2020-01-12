//
//  Content.swift
//  Algonos
//
//  Created by Tristan Bilot on 12/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import UIKit
import SwiftyJSON

class Content {
    var text: String?
    var complexity: Complexity?
    var code: UIImage?
    
    init(json: JSON) {
        text = json[0]["content"]["text"].string!
        code = UIImage().downloadImage(from: json[0]["content"]["code"].string!)
        complexity = Complexity(json: json)
    }
}
