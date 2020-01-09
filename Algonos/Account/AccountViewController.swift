//
//  AccountViewController.swift
//  Algonos
//
//  Created by Tristan Bilot on 12/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    
    @IBOutlet weak var progressBar: CircularProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressBar.labelSize = 20
        progressBar.safePercent = 100
        progressBar.setProgress(to: 1, withAnimation: true)
        progressBar.lineWidth = 5
        
    }
    
}
