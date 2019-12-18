//
//  CategoryViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 13/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController {
    
    var navigationItemTitle: String?
    var categoryId: String? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItemTitle()
    }
    
    func setNavigationItemTitle() {
        self.navigationItem.title = navigationItemTitle
    }

}
