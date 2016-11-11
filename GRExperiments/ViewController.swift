//
//  ViewController.swift
//  GRExperiments
//
//  Created by Davide Bertola on 11/11/2016.
//  Copyright © 2016 Davide Bertola. All rights reserved.
//

import Foundation
import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        
        let activityItem = WhiteActivityViewController.CustomActivityItem()
        
        let customActivity = WhiteActivityViewController.CustomActivity()
        
        let w = WhiteActivityViewController(activityItems: [activityItem], applicationActivities: [customActivity])
        w.excludedActivityTypes = [
            UIActivityType.
        ]
        self.present(w, animated: true, completion: nil)
    }
}
