//
//  MyView.swift
//  UILabelAlignment
//
//  Created by Davide Bertola on 23/08/16.
//  Copyright © 2016 Davide Bertola. All rights reserved.
//

import Foundation
import UIKit
import SnapKit


@IBDesignable class UILabelAlignBottomExample: UIView {
    
    // Example: 2 labels constrained to the bottom of their container,
    // flexible height, up to 2 lines, ellipsis on long text.
    // The effect is to have up to 2 lines of text aligned to bottom (if
    // there is only 1 line it sits at bottom)
    
    // This example also shows mixed used of anchors and snapkit.
    
    let label = UILabel()
    let labelShort = UILabel()

    
    // Used by running iOS app
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initialization()
    }
    
    // Used by Inteface Builder
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialization()
    }
    
    private func initialization() {
        label.font = UIFont.boldSystemFontOfSize(15)
        label.text = "Very Long Text. Very Long Text. Very Long Text. Very Long Text. Very Long Text. Very Long Text. "
        label.numberOfLines = 2
        label.layer.borderWidth = 1.0
        label.layer.borderColor = UIColor.grayColor().CGColor
        label.backgroundColor = UIColor.whiteColor()
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.snp_makeConstraints { (make) in
            make.left.equalTo(self.snp_left)
            make.bottom.equalTo(self.snp_bottom)
            make.width.equalTo(150)
        }
        
        labelShort.font = UIFont.boldSystemFontOfSize(15)
        labelShort.text = "Short Text"
        labelShort.numberOfLines = 2
        labelShort.layer.borderWidth = 1.0
        labelShort.layer.borderColor = UIColor.grayColor().CGColor
        labelShort.backgroundColor = UIColor.whiteColor()
        self.addSubview(labelShort)
        
        labelShort.translatesAutoresizingMaskIntoConstraints = false
        labelShort.leftAnchor.constraintEqualToAnchor(label.rightAnchor).active = true
        labelShort.bottomAnchor.constraintEqualToAnchor(self.bottomAnchor).active = true
        labelShort.widthAnchor.constraintEqualToConstant(100).active = true
        
    }
    
}