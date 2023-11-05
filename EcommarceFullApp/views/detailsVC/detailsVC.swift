//
//  detailsVC.swift
//  EcommarceFullApp
//
//  Created by Tipu on 5/11/23.
//

import UIKit

class detailsVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
 
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedItem: category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tabBarController?.tabBar.isHidden = true
      
    }
    
    @IBAction func backButtooonTapped(_ sender: Any) {
        
        tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
    
    
    
//MARK: COOLLECTION-VIEW
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        return cell
    }

}
