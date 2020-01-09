//
//  CourseURLBuilder.swift
//  Algonos
//
//  Created by Tristan Bilot on 18/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

class CourseURLBuilder: URLBuilderProtocol {
    
    let routeParam: String = "courses/"
    let fetchParam: String = "fetch/"
    let fetchWithIdParam: String = "fetchWithCategoryId/"
    
    var fetchPath: String
    var fetchWithIdPath: String
    
    init() {
        fetchPath = RequestAPI.server + routeParam + fetchParam
        fetchWithIdPath = RequestAPI.server + routeParam + fetchWithIdParam
    }
    
    /*
     * Fetch list of all the courses where course.category.id = category.id
     * Useful to display the courses of a specific category
     */
    func buildFetchWithCategoryIdURL(_ id: String?) -> URL? {
        let call = fetchWithIdPath + id!
        guard let url  = URL(string: call) else { return nil }
        return url
    }
    
    /*
     * Fetch all the courses of the database
     */
    func buildFetchURL() -> URL? {
        let call = fetchPath
        guard let url  = URL(string: call) else { return nil }
        return url
    }
}
