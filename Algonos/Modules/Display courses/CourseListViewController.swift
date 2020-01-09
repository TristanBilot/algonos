//
//  CourseListViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 13/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit
import SkeletonView

class CourseListViewController: UIViewController {
    var interactor: CoursesInteractor?
    
    var category: Category?
    var selectedCourse: Course?
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        view.showAnimatedGradientSkeleton()
        setNavigationItemTitle()
        setupNibCell()
        setup()
    }
    
    //MARK: - Setup functions
    func setup() {
        let presenter = CoursesPresenter(vc: self)
        let interactor = CoursesInteractor(presenter: presenter, category: self.category)
        self.interactor = interactor
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

//MARK: - Table view
extension CourseListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor?.courses.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CourseCell.cellIdentifier, for: indexPath) as! CourseCell
        cell.initCell(
            controller: self,
            course: (interactor?.courses[indexPath.row])!
        )
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCourse = interactor?.courses[indexPath.row]
        self.performSegue(withIdentifier: "categoryToCourse", sender: self)
    }
}

//MARK: - Shimmer
extension CourseListViewController: SkeletonTableViewDataSource {
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "shimmerCell"
    }
}
