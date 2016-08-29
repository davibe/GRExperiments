//
//  ResizableView.swift
//  GRExperiments
//
//  Created by Davide Bertola on 29/08/16.
//  Copyright © 2016 Davide Bertola. All rights reserved.
//

import UIKit

public class ResizableView: UIButton {

    var expanded = false
    var heightConstrain:NSLayoutConstraint!
    
    required public init?(coder: NSCoder) { // called on Device
        super.init(coder: coder)
        initialize()
    }
    
    override init(frame: CGRect) { // called in InterfaceBuilder
        super.init(frame: frame)
        initialize()
    }
        
    func initialize() {
        self.backgroundColor = UIColor.redColor()
        self.layer.borderColor = UIColor.grayColor().CGColor
        self.layer.borderWidth = 1
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraintEqualToConstant(100).active = true
        self.heightConstrain = self.heightAnchor.constraintEqualToConstant(100)
        self.heightConstrain.active = true
        self.expanded = false
        self.addTarget(self, action: #selector(onClick), forControlEvents: .TouchUpInside)
    }
    
    func onClick(sender:UIButton) {
        self.expanded = !self.expanded
        UIView.animateWithDuration(0.3) {
            if self.expanded {
                self.heightConstrain.constant = 200
            } else {
                self.heightConstrain.constant = 100
            }
            self.layoutIfNeeded()
        }
    }
}
