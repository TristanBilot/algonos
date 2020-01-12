//
//  CategoryRequest.swift
//  Algonos
//
//  Created by Tristan on 12/18/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation
import SwiftyJSON

class CategoryRequest: Request {
    var urlBuilder = CategoryURLBuilder()
      
    func fetch(_ completion: @escaping (_ json: JSON) -> Void) {
        guard let url = urlBuilder.buildFetchURL() else { return }
        RequestAPI.request(to: url, completion)
    }
    
    func fetchWithCategoryId(_ id: String?, _ completion: @escaping (_ json: JSON) -> Void) {
        guard let url = urlBuilder.buildFetchWithCategoryIdURL(id) else { return }
        RequestAPI.request(to: url, completion)
    }
    
    func fetchPercentagesForCategory(categoryId: String?, _ completion: @escaping (_ json: JSON) -> Void) {
        guard let url = urlBuilder.buildFetchPercentagesURL(categoryId) else { return }
        RequestAPI.request(to: url, completion)
    }
  
}
