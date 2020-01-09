//
//  ExerciseAPI.swift
//  Algonos
//
//  Created by Tristan Bilot on 14/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation
import SwiftyJSON

class CourseRequest: Request {
    var urlBuilder = CourseURLBuilder()
      
    func fetch(_ completion: @escaping (_ json: JSON) -> Void) {
        guard let url = urlBuilder.buildFetchURL() else { return }
        RequestAPI.request(to: url, completion)
    }
    
    func fetchWithId(_ id: String?, _ completion: @escaping (_ json: JSON) -> Void) {
        guard let url = urlBuilder.buildFetchWithCategoryIdURL(id) else { return }
        RequestAPI.request(to: url, completion)
    }
  
}
