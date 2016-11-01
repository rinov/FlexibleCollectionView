//
//  FlexibleCollectionView.swift
//  Pods
//
//  Created by Ryo Ishikawa on 11/1/16.
//
//

import Foundation

public final class FlexibleCollectionView: UICollectionView {
    
    public var layout: FlexibleCollectionViewLayout!
    
    public required init(frame: CGRect, layout: FlexibleCollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

        self.layout = layout
        
        configureGestures()
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func swipe(sender: UISwipeGestureRecognizer) {
        
        switch(sender.direction) {
            
        case UISwipeGestureRecognizerDirection.left: break
        
        case UISwipeGestureRecognizerDirection.right: break
        
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
    
    public func adaptGridLayout(animated: Bool = true) {

        guard layout.rows > 0 else { return }
/*
        let isPortrait = layout. .scrollDirection == .Vertical
        var length = isPortrait ? self.frame.width : self.frame.height
        length -= space * CGFloat(numberOfGridsPerRow - 1)
        length -= isPortrait ? (inset.left + inset.right) : (inset.top + inset.bottom)
        let side = length / CGFloat(numberOfGridsPerRow)
        guard side > 0.0 else {
            return
        }
        
        layout.itemSize = CGSize(width: side, height: side)
        layout.invalidateLayout()
  */  }
    
}
