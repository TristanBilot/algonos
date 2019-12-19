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
    
    func convierteImagen(cadenaImagen: String) -> UIImage? {
        let strings = cadenaImagen.split(separator: ",")
        var bytes = [UInt8]()
        for i in 0...strings.count - 1 {
            if let signedByte = Int8(strings[i]) {
                bytes.append(UInt8(bitPattern: signedByte))
            } else {
                // Do something with this error condition
            }
        }
        let datos: Data = Data(bytes: bytes, count: bytes.count)
        return UIImage(data: datos) // Note it's optional. Don't force unwrap!!!
    }
  
    func loadTableView() {
      CategoryRequest().fetch() { [weak self] json in
        if (json.count == 0) { return }
        for i in 0...json.count - 1 {
            self?.categories.append(json[i]["name"].string!)
            self?.categoriesId.append(json[i]["_id"].string!)
            do {
//                self?.images.append(UIImage(data: try (json[i]["image"]["data"]["data"] as! Data)))
//                print(try json[i]["image"]["data"]["data"].rawString())
                let data = json[i]["image"]["data"]["data"]
                let endMarker = NSData(bytes: data.string , length: data.count)
                self?.images.append(UIImage(data: endMarker as Data))
            } catch(let err) { print(err) }
            
//            let a = json[0]["user"] as? [String: Any?]?["name"] as? String
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
