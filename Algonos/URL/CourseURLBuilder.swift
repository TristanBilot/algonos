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
    let fetchWithCategoryIdParam: String = "fetchWithCategoryId/"
    let fetchWithIdParam: String = "fetchWithId/"
    
    var fetchPath: String
    var fetchWithCategoryIdPath: String
    var fetchWithIdPath: String
    
    init() {
        let URI = RequestAPI.server + routeParam
        fetchPath                = URI + fetchParam
        fetchWithCategoryIdPath  = URI + fetchWithCategoryIdParam
        fetchWithIdPath          = URI + fetchWithIdParam
    }
    
    /*
     * Fetch list of all the courses where course.category.id = category.id
     * Useful to display the courses of a specific category
     */
    func buildFetchWithCategoryIdURL(_ id: String?) -> URL? {
        let call = fetchWithCategoryIdPath + id!
        guard let url  = URL(string: call) else { return nil }
        return url
    }
    
    /*
     * Fetch all the courses of the database
     */
    func buildFetchURL() -> URL? {
        let call = fetchWithIdPath
        guard let url  = URL(string: call) else { return nil }
        return url
    }
    
    /*
     * Fetch the course of the specific id
     */
    func buildFetchWithIdURL(_ id: String?) -> URL? {
        let call = fetchWithIdPath + id!
        guard let url  = URL(string: call) else { return nil }
        return url
    }
}
