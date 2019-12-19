//
//  TestTableViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 12/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories: [String] = []
    var categoriesId: [String] = []
    let percentages: [String] = []
    var images: [UIImage?] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initStyle()
        loadTableView()
    }
  
    func loadTableView() {
      CategoryRequest().fetch() { [weak self] json in
        if (json.count == 0) { return }
        for i in 0...json.count - 1 {
            self?.categories.append(json[i]["name"] as! String)
            self?.categoriesId.append(json[i]["_id"] as! String)
            self?.images.append(UIImage().downloadImage(from: json[i]["image"] as! String))
        }
        self?.tableView.reloadData()
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
            if let tableViewUnwrap = tableView, let selectedIndex = tableViewUnwrap.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndex, animated: true)
            }
            vc.navigationItemTitle = categories[selectedIndex]
            vc.categoryId = categoriesId[selectedIndex]
        }
    }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell") as! TestTableViewCell
        cell.initCell(img:          images[indexPath.row],
                      category:     categories[indexPath.row],
                      categoryId:   categoriesId[indexPath.row])
        return cell
    }
}
