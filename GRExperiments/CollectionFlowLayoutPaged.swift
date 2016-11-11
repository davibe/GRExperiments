//
//  CollectionFlowLayoutPaged.swift
//  GRExperiments
//
//  Created by Davide Bertola on 02/09/16.
//  Copyright © 2016 Davide Bertola. All rights reserved.
//

import UIKit

class CollectionFlowLayoutPaged: UICollectionViewFlowLayout {
    
    // snap to cells, horizontally
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        var offsetAdjustment = CGFloat.greatestFiniteMagnitude
        let horizontalOffset = proposedContentOffset.x
        let targetRect = CGRect(x: proposedContentOffset.x, y: 0, width: self.collectionView!.bounds.size.width, height: self.collectionView!.bounds.size.height)
        
        for layoutAttributes in super.layoutAttributesForElements(in: targetRect)! {
            let itemOffset = layoutAttributes.frame.origin.x
            if (abs(itemOffset - horizontalOffset) < abs(offsetAdjustment)) {
                offsetAdjustment = itemOffset - horizontalOffset
            }
        }
        
        return CGPoint(x: proposedContentOffset.x + offsetAdjustment, y: proposedContentOffset.y)
    }
}
