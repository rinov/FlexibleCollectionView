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
        
        static let animationEnabled     = true
    
    }
    
    public var rows: Int = defaultValue.rows
    
    public var insets: UIEdgeInsets = defaultValue.insets
    
    public var animationEnabled = defaultValue.animationEnabled
    
    public override init() {
        super.init()
        
    }
    
    public init(rows: Int, insets: UIEdgeInsets = .zero) {
        super.init()
        
        self.rows = rows
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
