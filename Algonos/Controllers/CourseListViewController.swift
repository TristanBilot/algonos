//
//  CourseListViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 13/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class CourseListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categoryId: String?
    var navigationItemTitle: String?
    var selectedCourseId: Int? = nil
    var selectedCategory: String?
    var courses: [String?] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItemTitle()
        setupNibCell()
        loadTableView()
    }
  
    func loadTableView() {
      CourseRequest().fetchWithCategoryId(categoryId) { [weak self] coursesJSON in
        if coursesJSON.count == 0 {
            print("courses length = 0")
            return
        }
        for i in 0...coursesJSON.count - 1 {
            self?.courses.append(coursesJSON[i]["title"] as? String)
        }
            self?.tableView.reloadData()
      }
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
        if let vc = segue.destination as? CourseViewController {
//            vc.categoryId = selectedCourseId
            vc.navigationItemTitle = selectedCategory
        }
    }

}

extension CourseListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificCategoryCell", for: indexPath) as! SpecificCategoryCell
        cell.controller = self
        cell.categoryLabel.text = courses[indexPath.row]
        return cell
    }
}
