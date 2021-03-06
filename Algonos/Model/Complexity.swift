//
//  Complexity.swift
//  Algonos
//
//  Created by Tristan Bilot on 12/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import SwiftyJSON

class Complexity {
    var best: String?
    var average: String?
    var worst: String?
    
    init?(best: String?, average: String?, worst: String?) {
        self.best = best
        self.average = average
        self.worst = worst
    }
    
    init?(json: JSON) {
        self.best = json["best"].string ?? "?"
        self.average = json["average"].string ?? "?"
        self.worst = json["worst"].string ?? "?"
    }
}
