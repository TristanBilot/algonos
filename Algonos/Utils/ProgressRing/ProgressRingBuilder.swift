//
//  ProgressRingable.swift
//  Algonos
//
//  Created by Tristan Bilot on 31/12/2019.
//  Copyright © 2019 Tristan Bilot. All rights reserved.
//

import Foundation

class ProgressRingBuilder {
    
    func initProgressRing(progressBar: CircularProgressBar, safePercent: String, animation: Bool) {
        progressBar.labelSize = 14
        progressBar.lineWidth = 3
        progressBar.safePercent = Int(safePercent) ?? 0
        progressBar.setProgress(to: 1, withAnimation: animation)
    }
    
}
