//
//  CircularProgressbar.swift
//  Algonos
//
//  Created by Tristan Bilot on 01/01/2020.
//  Copyright © 2020 Tristan Bilot. All rights reserved.
//

import UIKit

class CircularProgressBar: UIView {
    
    //MARK: awakeFromNib
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupView()
        label.text = "0%"
    }
    
    //MARK: Public
    
    public var lineWidth:CGFloat = 50 {
        didSet{
            foregroundLayer.lineWidth = lineWidth
            backgroundLayer.lineWidth = lineWidth - (0.20 * lineWidth)
        }
    }
    
    public var labelSize: CGFloat = 20 {
        didSet {
            label.font = UIFont.systemFont(ofSize: labelSize)
            label.sizeToFit()
            configLabel()
        }
    }
    
    public var safePercent: Int = 100 {
        didSet{
            setForegroundLayerColorForSafePercent()
        }
    }
    
    public func setProgress(to progressConstant: Double, withAnimation: Bool) {
        
        var progress: Double {
            get {
                if progressConstant > 1 { return 1 }
                else if progressConstant < 0 { return 0 }
                else { return progressConstant }
            }
        }
        
        let animationTime = 1.0
        let animation = CABasicAnimation()
        if withAnimation {
            // Animation ring
            animation.keyPath = "strokeEnd"
            animation.fromValue = 0
            animation.toValue = 1
            /* ANIMATION TIME */
            animation.duration = animationTime
            foregroundLayer.add(animation, forKey: "foregroundAnimation")
            
            // Label time
            var currentTime:Double = 0
            let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { (timer) in
                currentTime += 0.02
                let percent = currentTime/2 * 100
                if Int(percent) > self.safePercent {
                    timer.invalidate()
                    self.pauseLayer(layer: self.layer)
                    self.layoutIfNeeded()
                    if self.safePercent >= 100 {
                        self.makeImage()
                    }
                    return
                }
                self.label.text = "\(Int(progress * percent))" + "%"
                self.setForegroundLayerColorForSafePercent()
                self.configLabel()
            }
            timer.fire()
        }
            // Without animation
        else {
            self.label.text = "\(safePercent)" + "%"
        }
    }
    
    func pauseLayer(layer: CALayer) {
        let pausedTime: CFTimeInterval = layer.convertTime(CACurrentMediaTime(), from: nil)
        layer.speed = 0.0
        layer.timeOffset = pausedTime
        layer.removeAllAnimations()
    }
    
    //MARK: Private
    private var label = UILabel()
    private let foregroundLayer = CAShapeLayer()
    private let backgroundLayer = CAShapeLayer()
    private var radius: CGFloat {
        get{
            if self.frame.width < self.frame.height { return (self.frame.width - lineWidth)/2 }
            else { return (self.frame.height - lineWidth)/2 }
        }
    }
    
    private var pathCenter: CGPoint{ get{ return self.convert(self.center, from:self.superview) } }
    private func makeBar(){
        self.layer.sublayers = nil
        drawBackgroundLayer()
        drawForegroundLayer()
    }
    
    private func drawBackgroundLayer(){
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
        self.backgroundLayer.path = path.cgPath
        self.backgroundLayer.strokeColor = UIColor.lightGray.cgColor
        self.backgroundLayer.lineWidth = lineWidth - (lineWidth * 20/100)
        self.backgroundLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(backgroundLayer)
        
    }
    
    private func drawForegroundLayer(){
        let startAngle = (-CGFloat.pi/2)
        let endAngle = 2 * CGFloat.pi + startAngle
        let path = UIBezierPath(arcCenter: pathCenter, radius: self.radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        foregroundLayer.lineCap = CAShapeLayerLineCap.round
        foregroundLayer.path = path.cgPath
        foregroundLayer.lineWidth = lineWidth
        foregroundLayer.fillColor = UIColor.clear.cgColor
        foregroundLayer.strokeColor = UIColor.red.cgColor
        // Very important to persist the line
        foregroundLayer.strokeEnd = CGFloat(self.safePercent) * 0.01
        
        self.layer.addSublayer(foregroundLayer)
        
    }
    
    private func makeLabel(withText text: String) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        label.text = text
        label.font = UIFont.systemFont(ofSize: labelSize)
        label.sizeToFit()
        label.center = pathCenter
        return label
    }
    
    private func makeImage() {
        label.isHidden = true
        let image = UIImage(systemName: "checkmark")
        let imageView = UIImageView()
        imageView.image = imageView.image?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(rgb: 0x4CAF50)
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageView.image = image
        imageView.center = pathCenter
        self.addSubview(imageView)
    }
    
    private func configLabel(){
        label.sizeToFit()
        label.center = pathCenter
    }
    
    private func extractPercentageSign(_ str: String) -> String {
        return str[0..<str.count - 1]
    }
    
    private func setForegroundLayerColorForSafePercent() {
        switch Int(extractPercentageSign(label.text!))! {
        case let x where x <= 20:
            self.foregroundLayer.strokeColor = UIColor(rgb: 0xF44336).cgColor
        case let x where x <= 40:
            self.foregroundLayer.strokeColor = UIColor(rgb: 0xFF9800).cgColor
        case let x where x <= 60:
            self.foregroundLayer.strokeColor = UIColor(rgb: 0xFFC107).cgColor
//        case let x where x <= 80:
//            self.foregroundLayer.strokeColor = UIColor(rgb: 0xCDDC39).cgColor
        case let x where x <= 100:
            self.foregroundLayer.strokeColor = UIColor(rgb: 0x4CAF50).cgColor
        default:
            self.foregroundLayer.strokeColor = UIColor.lightGray.cgColor
        }
    }
    
    private func setupView() {
        makeBar()
        self.addSubview(label)
    }
    
    /// - Layout Sublayers
    private var layoutDone = false
    override func layoutSublayers(of layer: CALayer) {
        if !layoutDone {
            let tempText = label.text
            setupView()
            label.text = tempText
            layoutDone = true
        }
    }
    
}
