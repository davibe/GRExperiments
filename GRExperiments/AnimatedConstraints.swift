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
        subview.backgroundColor = UIColor.red
        subview.addTarget(self, action: #selector(self.onTap), for: .touchUpInside)
        
        subview.translatesAutoresizingMaskIntoConstraints = false
        subview.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        subview.widthAnchor.constraint(equalToConstant: 50).isActive = true
        
        subviewHeightAnchor = subview.heightAnchor.constraint(equalToConstant: 50)
        subviewHeightAnchor.isActive = true
        
        subviewTopAnchor = subview.topAnchor.constraint(equalTo: self.topAnchor)
        subviewTopAnchor.isActive = true
        
        subviewBottomAnchor = subview.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        subviewBottomAnchor.isActive = false
        
    }
    
    func onTap(_ sender: UIButton) {
        // activate/deactivate constraint
        // order of operations is important to avoid conflict with height constrain
        if self.subviewBottomAnchor.isActive {
            self.subviewBottomAnchor.isActive = !self.subviewBottomAnchor.isActive
            self.subviewTopAnchor.isActive = !self.subviewTopAnchor.isActive
        } else {
            self.subviewTopAnchor.isActive = !self.subviewTopAnchor.isActive
            self.subviewBottomAnchor.isActive = !self.subviewBottomAnchor.isActive
        }

        // change constraints constants
        subviewHeightAnchor.constant += 10
        
        // tell the view to do it in an animated fashion :)

        UIView.animate(withDuration: 1, delay: 0, options: .allowUserInteraction, animations: {
            self.subview.layoutIfNeeded()
            }) { (Bool) in
                
        }
        
        
    }
}
