//
//  RequestModel.swift
//  Algonos
//
//  Created by Tristan on 12/18/19.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation
import SwiftyJSON

class RequestAPI {
    //    static let server: String = "http://192.168.1.52:8080/"
    static let server: String = "http://172.20.10.2:8080/"
    //    static let server: String = "http://localhost:8080/"
    
    static func request(to url: URL, _ completion: @escaping (_ json: JSON) -> Void) {
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {return}
            do {
                let json = try JSON(data: data, options: .allowFragments)
                DispatchQueue.main.async {
                    completion(json)
                }
            } catch let parsingError {
                print("Error", parsingError)
            }
        }
        task.resume()
    }
    
}
