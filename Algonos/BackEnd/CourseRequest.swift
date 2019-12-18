//
//  ExerciseAPI.swift
//  Algonos
//
//  Created by Tristan Bilot on 14/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

class CourseRequest {
    let path: String = RequestAPI.server + "courses/"
    
    func fetch(_ completion: @escaping (_ json: [[String: Any?]]) -> Void) {
      let call = path + "find"
      guard let url  = URL(string: call) else { return }
      RequestAPI.request(to: url, completion)
    }
    
    func fetchWithCategoryId(_ id: String?, _ completion: @escaping (_ json: [[String: Any?]]) -> Void) {
        let call = path + "findWithCategoryId/" + id!
        guard let url  = URL(string: call) else { return }
        RequestAPI.request(to: url, completion)
    }
  
}
