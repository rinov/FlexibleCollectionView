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
        
        layout.minimumLineSpacing = 4
        layout.minimumInteritemSpacing = 4
        layout.sectionInset = .zero

        collectionView = FlexibleCollectionView(frame: CGRect(x: 0,y: 0,width: size.width,height: size.height), layout: layout)
        
        view.addSubview(collectionView)

    }

}

