//
//  Request.swift
//  Algonos
//
//  Created by Tristan on 12/18/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

protocol Request {
    func fetch(_ completion: @escaping (_ json: [[String: Any]]) -> Void)
    func fetchWithId(_ id: String?, _ completion: @escaping (_ json: [[String: Any]]) -> Void)
}

