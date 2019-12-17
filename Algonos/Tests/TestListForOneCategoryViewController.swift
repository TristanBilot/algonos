//
//  TestListForOneCategoryViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 13/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class TestListForOneCategoryViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var navigationItemTitle: String?
    var selectedCourseId: Int? = nil
    var selectedCategory: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItemTitle()
        setupNibCell()
    }
    
    func setupNibCell() {
        let nib = UINib.init(nibName: "SpecificCategoryCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "SpecificCategoryCell")
    }
    
    func setNavigationItemTitle() {
        self.navigationItem.title = navigationItemTitle
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CategoryViewController {
            vc.courseId = selectedCourseId
            vc.navigationItemTitle = selectedCategory
        }
    }

}

extension TestListForOneCategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificCategoryCell", for: indexPath) as! SpecificCategoryCell
        cell.controller = self
        return cell
    }
}
