//
//  CategoryURLBuilder.swift
//  Algonos
//
//  Created by Tristan Bilot on 18/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

class CategoryURLBuilder: URLBuilderProtocol {
    
    let routeParam: String = "categories/"
    let fetchParam: String = "fetch/"
    let fetchWithCategoryIdParam: String = "fetchWithCategoryId/"
    let fetchPercentagesParam: String = "fetchPercentages/"
    
    var fetchPath: String
    var fetchWithCategoryIdPath: String
    var fetchPercentagesPath: String
    
    init() {
        fetchPath = RequestAPI.server + routeParam + fetchParam
        fetchWithCategoryIdPath = RequestAPI.server + routeParam + fetchWithCategoryIdParam
        fetchPercentagesPath = RequestAPI.server + routeParam + fetchPercentagesParam
    }
    
    /*
     * Not yet implemented in back-end...
     */
    func buildFetchWithCategoryIdURL(_ id: String?) -> URL? {
        let call = fetchWithCategoryIdPath + id!
        guard let url  = URL(string: call) else { return nil }
        return url
    }
    
    /*
     * Fetch all the categories of the database
     */
    func buildFetchURL() -> URL? {
        let call = fetchPath
        guard let url  = URL(string: call) else { return nil }
        return url
    }
    
    /*
    * Fetch all the percentages of courses for one category
    */
    func buildFetchPercentagesURL(_ id: String?) -> URL? {
        let call = fetchPercentagesPath + id!
        guard let url  = URL(string: call) else { return nil }
        return url
    }
    
    /*
    * Fetch the course of the specific id
    */
    func buildFetchWithIdURL(_ id: String?) -> URL? {
        let call = fetchPath + id!
        guard let url  = URL(string: call) else { return nil }
        return url
    }
    
}
