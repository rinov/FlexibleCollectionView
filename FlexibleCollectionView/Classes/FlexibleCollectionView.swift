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
    
    public var maximumRows = 10
    
    public var minimumRows = 1
    
    public required init(frame: CGRect, layout: FlexibleCollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

        self.layout = layout

        configureGestures()
        
        adaptGridLayout(animated: false)
  
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func swipe(sender: UISwipeGestureRecognizer) {
        
        switch(sender.direction) {
            
        case UISwipeGestureRecognizerDirection.left:
            
            if layout.rows + 1 <= maximumRows { layout.rows += 1 }
        
        case UISwipeGestureRecognizerDirection.right:

            if layout.rows - 1 >= minimumRows { layout.rows -= 1 }

        default: break

        }
        
        adaptGridLayout()
        
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

        if layout.rows < 1 { return }
        
        let isPortrait = layout.scrollDirection == .vertical
        
        var length = isPortrait ? frame.width : frame.height
        
        length -= CGFloat(4) * CGFloat(layout.rows - 1)

        length -= isPortrait ? (layout.insets.left + layout.insets.right) : (layout.insets.top + layout.insets.bottom)

        let side = length / CGFloat(layout.rows)
        
        let newLayout = UICollectionViewFlowLayout()

        newLayout.itemSize = CGSize(width: side, height: side)

        newLayout.minimumLineSpacing = 4
        newLayout.minimumInteritemSpacing = 4
        newLayout.sectionInset = UIEdgeInsets(top: 4,left: 4,bottom: 4,right: 4)

        newLayout.invalidateLayout()
        
        setCollectionViewLayout(newLayout, animated: animated)
        
    }
    
}
