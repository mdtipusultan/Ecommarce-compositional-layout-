//
//  topCollectionViewCell.swift
//  EcommarceFullApp
//
//  Created by Tipu on 27/10/23.
//

import UIKit

class topCollectionViewCell: UICollectionViewCell, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mic: UIButton!
    
    override func awakeFromNib() {
           super.awakeFromNib()
           searchBar.delegate = self // Assign the delegate to self
       }
    
    
    
    // Implement UISearchBarDelegate methods
       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
           // Handle search as the user types
           // You can filter your data based on the searchText and update your collection view or table view accordingly.
       }

       func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           // Handle search when the user taps the search button on the keyboard
           searchBar.resignFirstResponder() // Dismiss the keyboard
       }
}
