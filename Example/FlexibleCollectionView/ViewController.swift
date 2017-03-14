//
//  ViewController.swift
//  FlexibleCollectionView
//
//  Created by Ryo Ishikawa on 10/28/2016.
//  Copyright (c) 2016 Ryo Ishikawa. All rights reserved.
//

import UIKit
import FlexibleCollectionView

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: FlexibleCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = FlexibleCollectionViewLayout()
        layout.rows             = 4
        layout.spacing          = 15
        layout.duration         = 0.4
        layout.sectionInset     = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        collectionView.layout = layout
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CELL")
        view.addSubview(collectionView)
    }
    
}

// MARK: FlexibleCollectionViewDelegate

extension ViewController: FlexibleCollectionViewDelegate {

    func flexibleCollectionView(_ collectionView: FlexibleCollectionView, willSwipeViewFor direction: UISwipeGestureRecognizerDirection) {
        print(#function)
    }
    
    func flexibleCollectionView(_ collectionView: FlexibleCollectionView, didSwipeViewFor direction: UISwipeGestureRecognizerDirection) {
        print(#function)
    }
    
    func flexibleCollectionView(_ collectionView: FlexibleCollectionView, didFinishAnimation: Bool) {
        print(#function)
    }
    
}

// MARK: UICollectionViewDataSource

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath)
        cell.backgroundColor = UIColor.randomColor
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1000
    }
    
}

fileprivate extension UIColor {
    
    static var randomColor: UIColor {
        let r = Float(arc4random()%256)/255
        let g = Float(arc4random()%256)/255
        let b = Float(arc4random()%256)/255
        return UIColor.init(colorLiteralRed: r, green: g, blue: b, alpha: 1.0)
    }
    
}
