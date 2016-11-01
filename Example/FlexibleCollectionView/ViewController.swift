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

    var collectionView: FlexibleCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let size = UIScreen.main.bounds

        let layout = FlexibleCollectionViewLayout()
        
        layout.rows = 4
//        layout.insets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        layout.spacing = 15
        layout.animationEnabled = true
        layout.duration = 0.3
        layout.sectionInset = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        
        collectionView = FlexibleCollectionView(frame: CGRect(x: 0,y: 0,width: size.width,height: size.height), layout: layout)
        
        collectionView.dataSource = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CELL")

        view.addSubview(collectionView)

    }

}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath)
        
        cell.backgroundColor = UIColor.red
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 100
    
    }
    
}
