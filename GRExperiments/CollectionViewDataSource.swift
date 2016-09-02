//
//  CollectionViewDataSource.swift
//  GRExperiments
//
//  Created by Davide Bertola on 01/09/16.
//  Copyright © 2016 Davide Bertola. All rights reserved.
//

import UIKit
import Foundation

public class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var colletionFlowLayoutPaged = CollectionFlowLayoutPaged()
    
    public func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 33
    }
    
    public func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collection-view-cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.label.text = " \(indexPath.section):\(indexPath.row)"
        
        cell.widthAnchor.constraintEqualToConstant(200)
        cell.layoutIfNeeded()
        
        return cell
    }

}
