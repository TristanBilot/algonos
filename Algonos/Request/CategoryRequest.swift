//
//  CategoryRequest.swift
//  Algonos
//
//  Created by Tristan on 12/18/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

class CategoryRequest: BasicRequest {
    
    override init() {
        super.init()
        super.urlBuilder = CategoryURLBuilder()
    }
      
    override func fetch(_ completion: @escaping (_ json: [[String: Any?]]) -> Void) {
        super.fetch(completion)
    }
    
    override func fetchWithId(_ id: String?, _ completion: @escaping (_ json: [[String: Any?]]) -> Void) {
        super.fetchWithId(id, completion)
    }
  
}
