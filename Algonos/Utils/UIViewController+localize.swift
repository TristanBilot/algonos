//
//  UIView+localize.swift
//  Algonos
//
//  Created by Tristan Bilot on 13/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

extension UIViewController {
    func localize(_ str: String) -> String {
        return NSLocalizedString(str, comment: "")
    }
}
