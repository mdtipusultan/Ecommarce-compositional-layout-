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
        
        cellRegisttration()
      
    }
    
    func cellRegisttration(){
        // Register the 1st
        let cellNib1 = UINib(nibName: "frstCollectionViewCell", bundle: nil)
        collectionView.register(cellNib1, forCellWithReuseIdentifier: "cell100")
        
        // Register the 2nd
        let cellNib2 = UINib(nibName: "secondCollectionViewCell", bundle: nil)
        collectionView.register(cellNib2, forCellWithReuseIdentifier: "cell200")
        
        // Register the 3rd
        let cellNib3 = UINib(nibName: "thirdCollectionViewCell", bundle: nil)
        collectionView.register(cellNib3, forCellWithReuseIdentifier: "cell300")
        
        // Register the 4th
        let cellNib4 = UINib(nibName: "forthCollectionViewCell", bundle: nil)
        collectionView.register(cellNib4, forCellWithReuseIdentifier: "cell400")
        
        // Register the 5th
        let cellNib5 = UINib(nibName: "fifthCollectionViewCell", bundle: nil)
        collectionView.register(cellNib5, forCellWithReuseIdentifier: "cell500")
        
        // Register the 6th
        let cellNib6 = UINib(nibName: "sixthCollectionViewCell", bundle: nil)
        collectionView.register(cellNib6, forCellWithReuseIdentifier: "cell600")
        
        // Register the 7th
       // let cellNib7 = UINib(nibName: "secondCollectionViewCell", bundle: nil)
        //collectionView.register(cellNib7, forCellWithReuseIdentifier: "cell700")
    }
    
    @IBAction func backButtooonTapped(_ sender: Any) {
        
        tabBarController?.tabBar.isHidden = false
        navigationController?.popViewController(animated: true)
    }
    
    
    
//MARK: COOLLECTION-VIEW
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1 // Section 1
        }
        else if section == 1 {
            return 1 // Section 2
        }
        else if section == 2 {
            return 1 // Section 3
        }
        else if section == 3 {
            return 1 // Section 4
        }
        else if section == 4 {
            return 1 // Section 5
        }
        else if section == 5 {
            return 1 // Section 6
        }
        else {
            return 1 // Section 7
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            // Section 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell100", for: indexPath) as! frstCollectionViewCell
            return cell
        }
        else if indexPath.section == 1 {
            // Section 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell200", for: indexPath) as! secondCollectionViewCell
            return cell
        }
        
        else if indexPath.section == 2 {
            // Section 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell300", for: indexPath) as! thirdCollectionViewCell
            return cell
        }
        else if indexPath.section == 3 {
            // Section 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell400", for: indexPath) as! forthCollectionViewCell
            return cell
        }
        
        
        if indexPath.section == 4 {
            // Section 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell500", for: indexPath) as! fifthCollectionViewCell
            return cell
        }
        
        else {
            // Section 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell600", for: indexPath) as! sixthCollectionViewCell
            
            
            return cell
        }
    }

}
