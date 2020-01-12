//
//  CategoriesViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 12/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit
import SkeletonView

class CategoriesViewController: UIViewController {
    var interactor: CategoriesInteractor?
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Initialization
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.showAnimatedGradientSkeleton()
        initStyle()
    }
    
    //MARK: - Setup functions
    func initStyle() {
        self.navigationItem.title = Localizer.localize("HomeTitle")
    }
    
    func setup() {
        let presenter = CategoriesPresenter(vc: self)
        let interactor = CategoriesInteractor(presenter: presenter)
        self.interactor = interactor
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
            vc.category = interactor?.categories[selectedIndex]
        }
    }
}

//MARK: - Table view
extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.categories.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CategoryCell.cellIdentifier) as! CategoryCell
        guard let category = interactor?.categories[indexPath.row] else { return cell }
        cell.initCell(category: category)
        return cell
    }
    
}

//MARK: - Shimmer
extension CategoriesViewController: SkeletonTableViewDataSource {
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "shimmerCell"
    }
}
