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
    var interactor: CourseInteractor?
    
    var course: Course?
    
    private let sideMargin: CGFloat = 10.0
    private let topMargin: CGFloat = 15.0
    
    var elementCounter: Int = 0
    var elements: JSON? // array of json elements
    var stack = Stack<UIView>()
    
    //MARK: - Setup functions
    func setup() {
//        let presenter = CoursePresenter(vc: self, course: course)
//        let interactor = CourseInteractor(presenter: presenter, course: self.course)
//        self.interactor = interactor
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
    
    //MARK: - Elements construction
    func label(text: String) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    func image(url: String) -> UIImageView {
        let image = UIImage()
        let imageView = UIImageView(image: image)
        return imageView
    }
    
    //MARK: - View did load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        initScrollView()
        
        /* The scrollview is the first element of the stack */
        stack.push(scrollView)
        
        let label1 = label(text: "ABCvbcvnbxnbvnxbvnxbvnxb")
        label1.backgroundColor = UIColor.green
        addElement(label1)
        
        let label2 = label(text: "DEFvbcvnbxnbvnxbvnxbvnxbvxnvnxvbxnvb")
        label2.backgroundColor = UIColor.red
        addElement(label2)
    }
    
    func switchElement(json: JSON) {
        switch json["type"] {
        case "label":
            let lab = label(text: json["text"].string!)
            addElement(lab)
            break
        case "image":
            let img = image(url: json["url"].string!)
            addElement(img)
            break
        default:
            return
        }
    }
    
    func addElements() {
        guard let elements = elements else { return }
        for i in 0..<elements.count {
            switchElement(json: elements[i])
        }
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
        if elementCounter >= elements!.count {
            element.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        }
        stack.push(element)
    }
    
}
