//
//  HomeVC.swift
//  EcommarceFullApp
//
//  Created by Tipu on 27/10/23.
//

import UIKit

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        

    }

//MARK: COLLECTTION-VIEW
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ReusableView", for: indexPath) as! CollectionViewHeaderReusableView
            //header.setup(sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
}
