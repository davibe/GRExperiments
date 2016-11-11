//
//  ResizableView.swift
//  GRExperiments
//
//  Created by Davide Bertola on 29/08/16.
//  Copyright © 2016 Davide Bertola. All rights reserved.
//

import UIKit

open class ResizableView: UIButton {

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
        self.backgroundColor = UIColor.red
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 1
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: 100).isActive = true
        self.heightConstrain = self.heightAnchor.constraint(equalToConstant: 100)
        self.heightConstrain.isActive = true
        self.expanded = false
        self.addTarget(self, action: #selector(onClick), for: .touchUpInside)
    }
    
    func onClick(_ sender:UIButton) {
        self.expanded = !self.expanded
        UIView.animate(withDuration: 0.3, animations: {
            if self.expanded {
                self.heightConstrain.constant = 200
            } else {
                self.heightConstrain.constant = 100
            }
            self.layoutIfNeeded()
        }) 
    }
}
