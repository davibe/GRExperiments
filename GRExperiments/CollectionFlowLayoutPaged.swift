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
    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        var offsetAdjustment = CGFloat.max
        let horizontalOffset = proposedContentOffset.x
        let targetRect = CGRectMake(proposedContentOffset.x, 0, self.collectionView!.bounds.size.width, self.collectionView!.bounds.size.height)
        
        for layoutAttributes in super.layoutAttributesForElementsInRect(targetRect)! {
            let itemOffset = layoutAttributes.frame.origin.x
            if (abs(itemOffset - horizontalOffset) < abs(offsetAdjustment)) {
                offsetAdjustment = itemOffset - horizontalOffset
            }
        }
        
        return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y)
    }
}
