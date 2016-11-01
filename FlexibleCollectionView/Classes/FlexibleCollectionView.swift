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
        
        length -= isPortrait ? (layout.sectionInset.left + layout.sectionInset.right) : (layout.sectionInset.top + layout.sectionInset.bottom)

        length -= CGFloat(layout.spacing) * CGFloat(layout.rows - 1)

        let side = length / CGFloat(layout.rows)
        
        let newLayout = UICollectionViewFlowLayout()

        newLayout.itemSize = CGSize(width: side, height: side)

        newLayout.minimumLineSpacing = layout.spacing
        
        newLayout.minimumInteritemSpacing = layout.spacing
        
        newLayout.sectionInset = layout.sectionInset
        
        newLayout.invalidateLayout()
        
        UIView.animate(withDuration: layout.duration) { [weak self] in
            
            guard let `self` = self else { return }
            
            self.setCollectionViewLayout(newLayout, animated: self.layout.animationEnabled && animated)
            
        }
        
    }
    
}
