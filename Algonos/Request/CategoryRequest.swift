//
//  CategoryRequest.swift
//  Algonos
//
//  Created by Tristan on 12/18/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation
import SwiftyJSON

class CategoryRequest: BasicRequest {
    
    override init() {
        super.init()
        super.urlBuilder = CategoryURLBuilder()
    }
      
    override func fetch(_ completion: @escaping (_ json: JSON) -> Void) {
        super.fetch(completion)
    }
    
    override func fetchWithId(_ id: String?, _ completion: @escaping (_ json: JSON) -> Void) {
        super.fetchWithId(id, completion)
    }
  
}
