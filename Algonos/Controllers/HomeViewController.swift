//
//  TestTableViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 12/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit
import SkeletonView

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.showAnimatedGradientSkeleton()
        initStyle()
        loadTableView()
    }
  
    func loadTableView() {
      CategoryRequest().fetch() { [weak self] json in
        if (json.count == 0) { return }
        for i in 0...json.count - 1 {
          self?.categories.append(Category(json[i]))
        }
        self?.tableView.reloadData()
        self?.view.hideSkeleton()
      }
    }
  
    func initStyle() {
        self.navigationItem.title = localize("HomeTitle")
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "categoryListSegue",
            let vc = segue.destination as? CourseListViewController,
            let selectedIndex = tableView.indexPathForSelectedRow?.row
        {
            if let tableViewUnwrap = tableView,
              let selectedIndex = tableViewUnwrap.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndex, animated: true)
            }
          vc.category = categories[selectedIndex]
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.cellIdentifier) as! CategoryCell
        cell.initCell(
          img:      categories[indexPath.row].image,
          category: categories[indexPath.row].name!,
          difficulty: categories[indexPath.row].difficulty!
        )
        return cell
    }
}

extension HomeViewController: SkeletonTableViewDataSource {
  
  func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
    return "shimmerCell"
  }
}
