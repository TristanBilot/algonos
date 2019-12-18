//
//  CategoryURLBuilder.swift
//  Algonos
//
//  Created by Tristan Bilot on 18/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

class CategoryURLBuilder: URLBuilder {
    
    let routeParam: String = "categories/"
    let fetchParam: String = "fetch/"
    let fetchWithIdParam: String = "fetchWithCategoryId/"
    
    override init() {
        super.init()
        super.fetchPath += routeParam + fetchParam
        super.fetchWithIdPath += routeParam + fetchWithIdParam
    }
    
    /*
     * Not yet implemented in back-end...
     */
    override func buildFetchWithIdURL(_ id: String?) -> URL? {
        return super.buildFetchWithIdURL(id)
    }
    
    /*
     * Fetch all the categories of the database
     */
    override func buildFetchURL() -> URL? {
        return super.buildFetchURL()
    }
    
}
