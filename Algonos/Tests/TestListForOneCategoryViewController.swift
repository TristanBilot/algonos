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
    var arr: [String?] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItemTitle()
        setupNibCell()
        loadTableView()
    }
  
    func loadTableView() {
      CourseRequest().fetch() { [weak self] json in
        if json.count == 0 {
          return
        }
        for i in 0...json.count - 1 {
          self?.arr.append(json[i]["title"] as? String)
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
        if let vc = segue.destination as? CategoryViewController {
            vc.courseId = selectedCourseId
            vc.navigationItemTitle = selectedCategory
        }
    }

}

extension TestListForOneCategoryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SpecificCategoryCell", for: indexPath) as! SpecificCategoryCell
        cell.controller = self
        cell.categoryLabel.text = arr[indexPath.row]
        return cell
    }
}
