//
//  ComplexityTableView.swift
//  Algonos
//
//  Created by Tristan Bilot on 18/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import UIKit

class ComplexityTableView: UITableView {
    let heightOfOneRow: CGFloat = 40.0
    let heightOfSection: CGFloat = 35.0
    var complexities: Dictionary<String, String>?
    var headerTitle: String?
    
    func initComplexities(complexities: Dictionary<String, String>?, headerTitle: String? = "Time complexities") {
        self.dataSource = self
        self.delegate = self
        self.complexities = complexities
        self.headerTitle = headerTitle
        let nib = UINib.init(nibName: ComplexityTableViewCell.cellIdentifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: ComplexityTableViewCell.cellIdentifier)
        initStyle()
        self.reloadData()
    }
    
    func initStyle() {
        let totalHeight = CGFloat(complexities?.count ?? 0) * heightOfOneRow + heightOfSection
        self.heightAnchor.constraint(equalToConstant: totalHeight).isActive = true
    }
    
}

//MARK: - TableView delegate
extension ComplexityTableView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return complexities?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: ComplexityTableViewCell.cellIdentifier, for: indexPath) as! ComplexityTableViewCell
        guard let keys = complexities?.keys,
            let vals = complexities?.values else { return cell }
        let key = Array<String>(keys)[indexPath.row]
        let val = Array<String>(vals)[indexPath.row]
        
        cell.column1.text = key
        cell.column2.text = val
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightOfOneRow
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headerTitle
    }
}
