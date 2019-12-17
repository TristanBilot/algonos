//
//  CategoryViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 13/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var navigationItemTitle: String?
    var courseId: Int? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItemTitle()
    }
    
    func setNavigationItemTitle() {
        self.navigationItem.title = navigationItemTitle
    }

}
