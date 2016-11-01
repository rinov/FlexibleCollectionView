//
//  FlexibleCollectionViewLayout.swift
//  Pods
//
//  Created by Ryo Ishikawa on 11/1/16.
//
//

import Foundation

public final class FlexibleCollectionViewLayout: UICollectionViewFlowLayout {

    private struct defaultValue {
        
        static let rows: Int            = 4

        static let insets: UIEdgeInsets = .zero
        
        static let spacing: CGFloat     = 4.0
        
        static let duration: Double    = 0.3
        
        static let animationEnabled     = true

    }
    
    public var rows: Int = defaultValue.rows
    
    public var insets: UIEdgeInsets = defaultValue.insets
    
    public var spacing = defaultValue.spacing
    
    public var duration = defaultValue.duration
    
    public var animationEnabled = defaultValue.animationEnabled
    
    public override init() {
        super.init()
        
    }
    
    public init(rows: Int, insets: UIEdgeInsets = defaultValue.insets, spacing: CGFloat = defaultValue.spacing, duration: Double = defaultValue.duration ) {
        super.init()
        
        self.rows = rows

        self.insets = insets
        
        self.spacing = spacing
        
        self.duration = duration
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
