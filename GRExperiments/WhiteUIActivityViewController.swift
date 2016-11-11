//
//  WhiteUIActivityViewController.swift
//  GRExperiments
//
//  Created by Davide Bertola on 11/11/2016.
//  Copyright © 2016 Davide Bertola. All rights reserved.
//

import Foundation
import UIKit

class WhiteActivityViewController: UIActivityViewController {
    class CustomActivityItem {
        
    }
    
    class CustomActivity: UIActivity {
        override var activityType: UIActivityType? {
            get {
                return UIActivityType(rawValue: "custom-activity")
            }
        }
    
        override var activityTitle: String? { get { return "custom-activity" } }
        override var activityImage: UIImage? { get { return UIImage(named: "d") } }
        override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
            print("canPerformWithActivityItems", activityItems)
            return true
        }
        override func prepare(withActivityItems activityItems: [Any]) {}
        override class var activityCategory: UIActivityCategory { get { return UIActivityCategory.action }}

    }
}
