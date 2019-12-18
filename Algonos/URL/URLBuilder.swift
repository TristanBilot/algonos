//
//  URLBuilder.swift
//  Algonos
//
//  Created by Tristan Bilot on 18/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class URLBuilder: URLBuilderProtocol {
    
    var fetchPath = RequestAPI.server
    var fetchWithIdPath = RequestAPI.server
    
    func buildFetchWithIdURL(_ id: String?) -> URL? {
        let call = fetchWithIdPath + id!
        guard let url  = URL(string: call) else { return nil }
        return url
    }
    
    func buildFetchURL() -> URL? {
        let call = fetchPath
        guard let url  = URL(string: call) else { return nil }
        return url
    }

}
