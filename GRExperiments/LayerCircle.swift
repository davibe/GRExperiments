//
//  LayerCircle.swift
//  StatWidget
//
//  Created by Cristian Bellomo on 22/08/16.
//  Copyright © 2016 Grocerest. All rights reserved.
//

import Foundation
import UIKit

// IDENTICAL TO THE CUSTOM CIRCLE VIEW BUT USING CALAYERS AND ANIMATED ON PROGRESS CHANGE

@IBDesignable
class LayerCircle: UIView {
    
    // Example: Animated circular progress using Core Animation
    
    // inspectables
    
    @IBInspectable var bgCircleColor: UIColor = UIColor.blackColor()
    @IBInspectable var bgCircleLineWidth: CGFloat = 1.0
    @IBInspectable var circleColor: UIColor = UIColor.greenColor()
    @IBInspectable var circleLineWidth: CGFloat = 5.0
    @IBInspectable var progress: CGFloat = 0.5 { didSet { animateCircle() } }
    
    // pre-allocate layers (or subviews)
    
    private var bgCircleLayer: CAShapeLayer! = CAShapeLayer()
    private var circleLayer: CAShapeLayer! = CAShapeLayer()
    
    // initialize
    
    required init?(coder: NSCoder) { // called on Device
        super.init(coder: coder)
        setupHierarchy()
    }
    
    override init(frame: CGRect) { // called in InterfaceBuilder
        super.init(frame: frame)
        setupHierarchy()
    }
    
    // decide hierarchy once
    
    func setupHierarchy() {
        layer.addSublayer(bgCircleLayer)
        layer.addSublayer(circleLayer)
    }
    
    // re-layout things that are based on the changing frame size
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutUpdate()
        animateCircle()
    }
    
    // rest of the view logic ...
    
    func layoutUpdate() {
        let center = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        let radius = min(frame.size.width / 2, frame.size.height / 2) - circleLineWidth / 2
        
        func degreesToRadians(angle: Int) -> CGFloat {
            return CGFloat(angle) * CGFloat(M_PI) / 180
        }
        
        let bgCircle = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: -degreesToRadians(90),
            endAngle: degreesToRadians(360),
            clockwise: true
        )
        
        bgCircleLayer.path = bgCircle.CGPath
        bgCircleLayer.fillColor = UIColor.clearColor().CGColor
        bgCircleLayer.strokeColor = bgCircleColor.CGColor
        bgCircleLayer.lineWidth = bgCircleLineWidth;
        bgCircleLayer.strokeEnd = 1.0
        
        let circle = UIBezierPath(
            arcCenter: center,
            radius: radius,
            startAngle: -degreesToRadians(90),
            endAngle: degreesToRadians(360),
            clockwise: true
        )
        
        circleLayer.path = circle.CGPath
        circleLayer.fillColor = UIColor.clearColor().CGColor
        circleLayer.strokeColor = circleColor.CGColor
        circleLayer.lineWidth = circleLineWidth;
        circleLayer.strokeEnd = 0.0
    }
    
    private func animateCircle() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = 1.0
        animation.fromValue = 0
        animation.toValue = progress
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        circleLayer.strokeEnd = progress
        circleLayer.addAnimation(animation, forKey: "animateCircle")
    }
}