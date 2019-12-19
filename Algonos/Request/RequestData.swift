//
//  RequestData.swift
//  Algonos
//
//  Created by Admin on 12/19/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

class JSONModel {

  var jsonData: [[String: Any?]]?
  
  init(_ data: [[String: Any?]]?) {
    self.jsonData = data
  }

}
