//
//  ExerciseAPI.swift
//  Algonos
//
//  Created by Tristan Bilot on 14/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

class CourseAPI {
  static let server: String = "http://localhost:8080/courses/"
    
    static func getCourses(_ completion: @escaping (_ json: [[String: Any?]]) -> Void) {
      let call = server + "find"
      guard let url  = URL(string: call) else { return }
      CourseAPI.request(to: url, completion)
    }
  
    static func request(to url: URL, _ completion: @escaping (_ json: [[String: Any?]]) -> Void) {
        
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {return}
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                guard let jsonArray = jsonResponse as? [[String: Any]] else {return}
                DispatchQueue.main.async {
                  completion(jsonArray)
                }
            } catch let parsingError {
                 print("Error", parsingError)
            }
        }
        task.resume()
    }
}
