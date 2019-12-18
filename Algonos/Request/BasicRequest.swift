//
//  BasicRequest.swift
//  Algonos
//
//  Created by Tristan Bilot on 18/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

class BasicRequest: Request {
    var urlBuilder: URLBuilder?
    
    func fetch(_ completion: @escaping (_ json: [[String: Any?]]) -> Void) {
        guard let url = urlBuilder?.buildFetchURL() else { return }
        RequestAPI.request(to: url, completion)
    }
    
    func fetchWithId(_ id: String?, _ completion: @escaping (_ json: [[String: Any?]]) -> Void) {
        guard let url = urlBuilder?.buildFetchWithIdURL(id) else { return }
        RequestAPI.request(to: url, completion)
    }
    
}
