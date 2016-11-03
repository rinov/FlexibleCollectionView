//
//  FlexibleCollectionViewDelegate.swift
//  Pods
//
//  Created by Ryo Ishikawa on 11/3/16.
//
//

@objc public protocol FlexibleCollectionViewDelegate: UICollectionViewDelegate {

    @objc optional func flexibleCollectionView(_ collectionView: FlexibleCollectionView, willSwipeViewFor direction: UISwipeGestureRecognizerDirection)

    @objc optional func flexibleCollectionView(_ collectionView: FlexibleCollectionView, didSwipeViewFor direction: UISwipeGestureRecognizerDirection)

    @objc optional func flexibleCollectionView(_ collectionView: FlexibleCollectionView, didFinishAnimation: Bool)

}
