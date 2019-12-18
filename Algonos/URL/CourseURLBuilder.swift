//
//  CourseURLBuilder.swift
//  Algonos
//
//  Created by Tristan Bilot on 18/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

class CourseURLBuilder: URLBuilder {
    
    let routeParam: String = "courses/"
    let fetchParam: String = "fetch/"
    let fetchWithIdParam: String = "fetchWithCategoryId/"
    
    override init() {
        super.init()
        super.fetchPath += routeParam + fetchParam
        super.fetchWithIdPath += routeParam + fetchWithIdParam
    }
    
    /*
     * Fetch list of all the courses where course.category.id = category.id
     * Useful to display the courses of a specific category
     */
    override func buildFetchWithIdURL(_ id: String?) -> URL? {
        return super.buildFetchWithIdURL(id)
    }
    
    /*
     * Fetch all the courses of the database
     */
    override func buildFetchURL() -> URL? {
        return super.buildFetchURL()
    }
}
