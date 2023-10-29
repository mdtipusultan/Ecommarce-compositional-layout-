//
//  CollectionViewHeaderReusableView.swift
//  EcommarceFullApp
//
//  Created by Tipu on 27/10/23.
//

import UIKit

class CollectionViewHeaderReusableView: UICollectionReusableView {
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var viewAllButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Customize the appearance of the title label
        title.font = UIFont.boldSystemFont(ofSize: 18)
        title.textColor = UIColor.black
        
        // Customize the appearance of the "See All" button
        viewAllButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        viewAllButton.setTitleColor(UIColor.blue, for: .normal)
    }

}
