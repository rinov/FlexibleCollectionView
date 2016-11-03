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
    
    private var _delegate: FlexibleCollectionViewDelegate?
    
    public override var delegate: UICollectionViewDelegate? {
        
        get {
        
            return _delegate
        
        }
        
        set {
            
            _delegate = newValue as? FlexibleCollectionViewDelegate
        
        }
        
    }
    
    public required init(frame: CGRect, layout: FlexibleCollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)

        self.layout = layout

        configureGestures()
        
        adaptGridLayout(animated: false)
  
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

        if layout.animationEnabled && animated {
        
            UIView.animate(withDuration: layout.duration, animations: { [weak self] in

                guard let `self` = self else { return }
                
                self.setCollectionViewLayout(newLayout, animated: true)

                }, completion: { [weak self] _ in
                    
                    guard let `self` = self else { return }
                    
                    self._delegate?.flexibleCollectionView!(self, didFinishAnimation: true)
                    
            })
            
        }else{
            
            setCollectionViewLayout(newLayout, animated: false)

        }
        
    }
    
    // MARK: Private Methods
    
    private func configureGestures() {
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(swipe(sender:)))
        let right = UISwipeGestureRecognizer(target: self, action: #selector(swipe(sender:)))
        
        left.direction = .left
        right.direction = .right
        
        addGestureRecognizer(left)
        addGestureRecognizer(right)
        
    }
    
    @objc private func swipe(sender: UISwipeGestureRecognizer) {
        
        _delegate?.flexibleCollectionView?(self, willSwipeViewFor: sender.direction)
        
        switch(sender.direction) {
            
        case UISwipeGestureRecognizerDirection.left:
            
            if layout.rows + 1 <= layout.maximumRows { layout.rows += 1 }
            
        case UISwipeGestureRecognizerDirection.right:
            
            if layout.rows - 1 >= layout.minimumRows { layout.rows -= 1 }
            
        default: break
            
        }
        
        adaptGridLayout()
        
        _delegate?.flexibleCollectionView?(self, didSwipeViewFor: sender.direction)
        
    }

    
}
