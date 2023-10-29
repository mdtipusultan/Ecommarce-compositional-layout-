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
    
    func setup(product: category) {
          self.productImage.image = UIImage(named: product.image)
          self.productTitle.text = product.title
          self.productPrice.text = product.price
          // Customize the appearance of the cell if needed
      }
    
    @IBAction func favouriteButtonTapped(_ sender: UIButton) {
        
    }
    
}
