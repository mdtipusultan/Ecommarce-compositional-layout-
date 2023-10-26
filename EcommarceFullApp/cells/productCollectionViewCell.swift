//
//  productCollectionViewCell.swift
//  EcommarceFullApp
//
//  Created by Tipu on 27/10/23.
//

import UIKit

class productCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var favouriteButton: UIButton!
    
    
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        
    }
    
}
