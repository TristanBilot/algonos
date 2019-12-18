//
//  URLBuilder.swift
//  Algonos
//
//  Created by Tristan Bilot on 18/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

protocol URLBuilderProtocol {
    func buildFetchWithIdURL(_ id: String?) -> URL?
    func buildFetchURL() -> URL?
}
