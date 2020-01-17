//
//  ViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 14/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import UIKit
import SwiftyJSON

class CourseViewController : UIViewController {
    var presenter: CoursePresentable?
    
    var course: Course?
    
    private let sideMargin: CGFloat = 10.0
    private let topMargin: CGFloat = 15.0
    
    var elementCounter: Int = 0
    var stack = Stack<UIView>()
    
    //MARK: - Setup functions
    func setup() {
        let presenter = CoursePresenter(vc: self, course: course)
        self.presenter = presenter
    }
    
    //MARK: - Init
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    func initScrollView() {
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0.0).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0.0).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0.0).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0).isActive = true
    }
  
    func setNavigationItemTitle() {
        self.navigationItem.title = course?.title
    }
    
    
    //MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationItemTitle()
      
        view.addSubview(scrollView)
        initScrollView()
        
        /* The scrollview is the first element of the stack */
        stack.push(scrollView)
        setup()
    }
    
    func addElement(_ view: UIView) {
        scrollView.addSubview(view)
        positionElement(view)
    }
    
    func positionElement(_ element: UIView) {
        elementCounter += 1
        element.widthAnchor.constraint(equalToConstant: view.frame.width - 2 * sideMargin).isActive = true
        /* The first must be constrainted to the top of the scrollview (1st element of the stack) */
        if (elementCounter == 1) {
            element.leadingAnchor.constraint(equalTo: stack.peek().leadingAnchor, constant: sideMargin).isActive = true
            element.trailingAnchor.constraint(equalTo: stack.peek().trailingAnchor, constant: sideMargin).isActive = true
            element.topAnchor.constraint(equalTo: stack.peek().topAnchor, constant: topMargin).isActive = true
        }
        else {
            element.leadingAnchor.constraint(equalTo: stack.peek().leadingAnchor).isActive = true
            element.trailingAnchor.constraint(equalTo: stack.peek().trailingAnchor).isActive = true
            element.topAnchor.constraint(equalTo: stack.peek().bottomAnchor, constant: topMargin).isActive = true
        }
        guard let course = course else { return }
        if elementCounter >= course.elements.count {
            element.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        }
        stack.push(element)
    }
    
}
