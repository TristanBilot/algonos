//
//  Model.swift
//  Algonos
//
//  Created by Tristan on 12/19/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import SwiftyJSON

protocol Model {
  var json: JSON { get set }
  func loadData()
}
