//
//  CoursePresentable.swift
//  Algonos
//
//  Created by Tristan Bilot on 09/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import UIKit

protocol CoursePresentable {
    func presentText(_ text: String)
    func presentImage(_ image: UIImage)
    func presentComplexity(_ complexity: Complexity)
}
