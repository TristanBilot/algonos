//
//  AccountViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 12/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit
import UICircularProgressRing

class AccountViewController: UIViewController {
  
  var progressRing = UICircularProgressRing()
  
  @IBOutlet weak var littleView: UIView!
  
  @IBAction func animateTap(_ sender: Any) {
    progressRing.startProgress(to: 0, duration: 5.0) {
      print("Done animating!")
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
  }
  
}
