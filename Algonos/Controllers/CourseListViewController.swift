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
    
    var category: Category?
    //selected courseCell (for use the segue from this controller)
    var selectedCourse: Course?
    var courses: [Course] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItemTitle()
        setupNibCell()
        loadTableView()
    }
  
    func loadTableView() {
      CourseRequest().fetchWithCategoryId(category?._id) { [weak self] json in
        if json.count == 0 { return }
        for i in 0...json.count - 1 {
          self?.courses.append(Course(json[i]))
        }
        self?.tableView.reloadData()
      }
    }
    
    func setupNibCell() {
      let nib = UINib.init(nibName: CourseCell.cellIdentifier, bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: CourseCell.cellIdentifier)
    }
    
    func setNavigationItemTitle() {
        self.navigationItem.title = category?.name
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? CourseViewController {
          vc.course = selectedCourse
        }
    }

}

extension CourseListViewController: UITableViewDataSource, UITableViewDelegate {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return courses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CourseCell.cellIdentifier, for: indexPath) as! CourseCell
        cell.initCell(
            controller: self,
            course: courses[indexPath.row]
        )
        return cell
    }
}
