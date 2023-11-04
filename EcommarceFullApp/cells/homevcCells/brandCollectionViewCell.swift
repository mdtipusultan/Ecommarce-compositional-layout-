//
//  brandCollectionViewCell.swift
//  EcommarceFullApp
//
//  Created by Tipu on 27/10/23.
//

import UIKit

class brandCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var topView: UIView!
    
    @IBOutlet weak var imageTopViiew: UIView!
    
    @IBOutlet weak var logo: UIImageView!
    
    @IBOutlet weak var brandName: UILabel!
    
    func setup(logo: brands) {
           self.logo.image = UIImage(named: logo.brandImage)
           self.brandName.text = logo.brandName
           // Customize the appearance of the cell if needed
       }
    
    override func awakeFromNib() {
           super.awakeFromNib()
        
        imageTopViiew.layer.cornerRadius = 10
        contentView.layer.cornerRadius = 10


       }
}
