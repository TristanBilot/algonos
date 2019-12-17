//
//  ExerciseAPI.swift
//  Algonos
//
//  Created by Tristan Bilot on 14/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

class CourseAPI {
    
    static func sendRequest() {
        let server = "http://localhost:8080/getCourses"
        
        guard let url  = URL(string: server) else {return}
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            if let error = error {
                print(error)
                return
            }
            guard let data = data else {return}
            do{
                let jsonResponse = try JSONSerialization.jsonObject(with: data, options: [])
                guard let jsonArray = jsonResponse as? [[String: Any]] else {return}
                for i in 0...jsonArray.count - 1 {
                    print(jsonArray[i])
                }
                
            } catch let parsingError {
                 print("Error", parsingError)
            }
        }
        task.resume()
    }
}
