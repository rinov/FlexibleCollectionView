//
//  FlexibleCollectionViewLayout.swift
//  Pods
//
//  Created by Ryo Ishikawa on 11/1/16.
//
//

public final class FlexibleCollectionViewLayout: UICollectionViewFlowLayout {

    private enum DefaultValue {
        
        static let rows                 = 4
        
        static let maximumRows          = 10
        
        static let minimumRows          = 1

        static let spacing: CGFloat     = 4.0
        
        static let duration             = 0.3
        
        static let animationEnabled     = true

    }
    
    public var rows                 = DefaultValue.rows
    
    public var maximumRows          = DefaultValue.maximumRows
    
    public var minimumRows          = DefaultValue.minimumRows
    
    public var spacing              = DefaultValue.spacing
    
    public var duration             = DefaultValue.duration
    
    public var animationEnabled     = DefaultValue.animationEnabled
    
    public override init() {
        super.init()
    }
    
    public init(rows: Int, spacing: CGFloat = DefaultValue.spacing, duration: Double = DefaultValue.duration ) {
        super.init()
        
        self.rows       = rows
        
        self.spacing    = spacing
        
        self.duration   = duration
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
