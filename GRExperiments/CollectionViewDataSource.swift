//
//  CollectionViewDataSource.swift
//  GRExperiments
//
//  Created by Davide Bertola on 01/09/16.
//  Copyright © 2016 Davide Bertola. All rights reserved.
//

import UIKit
import Foundation

open class CollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var colletionFlowLayoutPaged = CollectionFlowLayoutPaged()
    
    open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 33
    }
    
    open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection-view-cell", for: indexPath) as! CollectionViewCell
        cell.label.text = " \(indexPath.section):\(indexPath.row)"
        
        cell.widthAnchor.constraint(equalToConstant: 200)
        cell.layoutIfNeeded()
        
        return cell
    }

}
