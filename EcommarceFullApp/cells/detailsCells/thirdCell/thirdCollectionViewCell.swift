//
//  thirdCollectionViewCell.swift
//  EcommarceFullApp
//
//  Created by Tipu on 7/11/23.
//

import UIKit

class thirdCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var images: UIImageView!
    
    func configure(image: UIImage) {
        images.image = image
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        images.contentMode = .scaleAspectFit
    }
}
