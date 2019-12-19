//
//  ExerciseAPI.swift
//  Algonos
//
//  Created by Tristan Bilot on 14/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation
import SwiftyJSON

class CourseRequest: BasicRequest {
    
    override init() {
        super.init()
        super.urlBuilder = CourseURLBuilder()
    }
    
    override func fetch(_ completion: @escaping (_ json: JSON) -> Void) {
        super.fetch(completion)
    }
    
    func fetchWithCategoryId(_ id: String?, _ completion: @escaping (_ json: JSON) -> Void) {
        super.fetchWithId(id, completion)
    }
  
}