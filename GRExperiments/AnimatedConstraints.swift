//
//  AnimatedConstraints.swift
//  GRExperiments
//
//  Created by Davide Bertola on 24/08/16.
//  Copyright © 2016 Davide Bertola. All rights reserved.
//

import Foundation

import Foundation
import UIKit

@IBDesignable


class AnimatedConstraints: UIView {
    // A view with a subview that is clickable.
    // `onTap` subview constraints are updated in an animated fashion
    
    required init?(coder: NSCoder) { // called on Device
        super.init(coder: coder)
        setupHierarchy()
    }
    
    override init(frame: CGRect) { // called in InterfaceBuilder
        super.init(frame: frame)
        setupHierarchy()
    }

    var subview = UIButton()
    var subviewTopAnchor: NSLayoutConstraint!
    var subviewBottomAnchor: NSLayoutConstraint!
    var subviewHeightAnchor: NSLayoutConstraint!
    
    
    func setupHierarchy() {
        self.addSubview(subview)
        subview.backgroundColor = UIColor.redColor()
        subview.addTarget(self, action: #selector(self.onTap), forControlEvents: .TouchUpInside)
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.centerXAnchor.constraintEqualToAnchor(self.centerXAnchor).active = true
        subview.widthAnchor.constraintEqualToConstant(50).active = true
        
        subviewHeightAnchor = subview.heightAnchor.constraintEqualToConstant(50)
        subviewHeightAnchor.active = true
        
        
        subviewTopAnchor = subview.topAnchor.constraintEqualToAnchor(self.topAnchor)
        subviewTopAnchor.active = true
        
        subviewBottomAnchor = subview.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor)
        subviewBottomAnchor.active = false
        
    }
    
    func onTap(sender: UIButton) {
        // activate/deactivate constraint
        self.subviewTopAnchor.active = !self.subviewTopAnchor.active
        self.subviewBottomAnchor.active = !self.subviewBottomAnchor.active

        // change constraints constants
        subviewHeightAnchor.constant += 10
        
        // tell the view to do it in an animated fashion :)
        UIView.animateWithDuration(0.3) {
            self.subview.layoutIfNeeded()
        }
    }
}