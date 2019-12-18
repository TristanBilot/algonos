//
//  CategoryRequest.swift
//  Algonos
//
//  Created by Tristan on 12/18/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

class CategoryRequest: Request {
      let path: String = RequestAPI.server + "categories/"
      
      func fetch(_ completion: @escaping (_ json: [[String: Any?]]) -> Void) {
        let call = path + "find"
        guard let url  = URL(string: call) else { return }
        RequestAPI.request(to: url, completion)
      }
    
    func fetchWithId(_ completion: @escaping (_ json: [[String: Any?]]) -> Void) {
      let call = path + "findWithId/"
      guard let url  = URL(string: call) else { return }
      RequestAPI.request(to: url, completion)
    }
  
}
