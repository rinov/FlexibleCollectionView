//
//  FlexibleCollectionView.swift
//  Pods
//
//  Created by Ryo Ishikawa on 11/1/16.
//
//

import Foundation

public final class FlexibleCollectionView: UICollectionView {
    
    public override required init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

        configureGestures()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func swipe(sender: UISwipeGestureRecognizer) {
        
        switch(sender.direction) {
            
        case UISwipeGestureRecognizerDirection.left: break
        
        case UISwipeGestureRecognizerDirection.left: break
        
        default: break

        }
        
    }
    
    // MARK: Private Methods
    
    func configureGestures() {
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipe(sender:)))
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipe(sender:)))
        
        left.direction = .left
        right.direction = .right
        
        addGestureRecognizer(left)
        addGestureRecognizer(right)

    }
    
}
