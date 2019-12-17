//
//  TestTableViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 12/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let categories = ["Data structure", "Algorithm", "Deep Learning"]
    let percentages = ["39", "70", "100"]
    let images = ["data_struct.png", "algorithm.png", "ai.png"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initStyle()
    }
    
    func initStyle() {
        self.navigationItem.title = localize("HomeTitle")
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        CourseAPI.sendRequest()
        if  segue.identifier == "categoryListSegue",
            let vc = segue.destination as? TestListForOneCategoryViewController,
            let selectedIndex = tableView.indexPathForSelectedRow?.row
        {
            if let tableViewUnwrap = tableView, let selectedIndex = tableViewUnwrap.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedIndex, animated: true)
            }
            vc.navigationItemTitle = categories[selectedIndex]
        }
    }
}

extension TestViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestCell") as! TestTableViewCell
        cell.initCell(img: UIImage(named: images[indexPath.row]), category: categories[indexPath.row], score: percentages[indexPath.row] + "%")
        return cell
    }
}
