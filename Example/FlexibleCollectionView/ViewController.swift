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
        layout.insets = UIEdgeInsets(top: 4,left: 4,bottom: 4,right: 4)
        layout.animationEnabled = true
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.sectionInset = UIEdgeInsets(top: 4,left: 4,bottom: 4,right: 4)

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
