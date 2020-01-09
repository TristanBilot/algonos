//
//  Request.swift
//  Algonos
//
//  Created by Tristan on 12/18/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol Request {
    func fetch(_ completion: @escaping (_ json: JSON) -> Void)
    func fetchWithId(_ id: String?, _ completion: @escaping (_ json: JSON) -> Void)
}
