//
//  HomeVC.swift
//  EcommarceFullApp
//
//  Created by Tipu on 27/10/23.
//

import UIKit

class HomeVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var brands: [brands] = [] // Populate this with your product data
    var category: [category] = [] // Populate this with your logo data
    let sectionTitles = ["Section 1 Title", "Choose Brand", "New Arraival"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        brands = TestData.shared.brandsData
        category = TestData.shared.categoryData
        
        
        collectionView.collectionViewLayout = createCompositionalLayout()
        //createCompositionalLayout()
        
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        
        let layout = UICollectionViewCompositionalLayout(sectionProvider: { sectionIndex, environment in
            var section: NSCollectionLayoutSection
            
            // Define the section based on sectionIndex
            
            // Section 0: Search Bar
            if sectionIndex == 0 {
                section = self.createFirstSectionLayout()
            }
            // Section 1: Logos
            else if sectionIndex == 1 {
                section = self.createSecondSectionLayout()
                
                // Add section header to each section
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                section.boundarySupplementaryItems = [header]
            }
            // Section 2: Products
            else {
                section = self.createThirdSectionLayout()
                
                // Add section header to each section
                let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50))
                let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                section.boundarySupplementaryItems = [header]
            }
            
            return section
        }, configuration: configuration)
        
        collectionView.collectionViewLayout = layout
        
        return layout
    }
    
    func createFirstSectionLayout() -> NSCollectionLayoutSection {
        
        // Calculate the section height based on the screen height
        let screenHeight = UIScreen.main.bounds.height
        let sectionHeight: CGFloat = 123 * (screenHeight / 812.0) // Adjust the multiplier as needed
        
        
        // Define layout for the first section with vertical arrangement
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(sectionHeight))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 0, trailing: 0)
        
        return section
    }
    
    func createSecondSectionLayout() -> NSCollectionLayoutSection {
        // Define layout for the second section with horizontal arrangement
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .absolute(50))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    func createThirdSectionLayout() -> NSCollectionLayoutSection {
        
        // Calculate the section height based on the screen height
        let screenHeight = UIScreen.main.bounds.height
        let itemHeight: CGFloat = 257 * (screenHeight / 812.0) // Adjust the multiplier as needed
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(itemHeight))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 20)
        
        // Create a group with horizontal layout containing two items
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item, item])
        
        // Create a section with a vertical group of horizontal groups (each containing two items)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        return section
    }
    
    //MARK: COLLECTTION-VIEW
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1 // Section 1
        } else if section == 1 {
            return brands.count // Section 2
        } else {
            return category.count // Section 3
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            // Section 1: Search Bar
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell1", for: indexPath) as! topCollectionViewCell
            //cell.setup(searchBar: searchBar)
            return cell
        } else if indexPath.section == 1 {
            // Section 2: Logo and Logo Name
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! brandCollectionViewCell
            let logo = brands[indexPath.item]
            cell.setup(logo: logo)
            return cell
        } else {
            // Section 3: Product
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell3", for: indexPath) as! productCollectionViewCell
            let product = category[indexPath.item]
            cell.setup(product: product)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerView", for: indexPath) as? CollectionViewHeaderReusableView {
                // Customize the header view based on the section
                let sectionTitle = sectionTitles[indexPath.section]
                headerView.title?.text = sectionTitle
                return headerView
            } else {
                print("Failed to create header view")
            }
        }
        return UICollectionReusableView()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 1 {
            let selectedItem = brands[indexPath.item]
            print("Selected item in the second section: \(selectedItem)")
            
        } else if indexPath.section == 2 {
            
            let selectedItem = category[indexPath.item]
            print("Selected item in the second section: \(selectedItem)")

            let detailView = self.storyboard?.instantiateViewController(withIdentifier: "detailsVC") as! detailsVC
            
            detailView.selectedItem = selectedItem
            
            self.navigationController?.pushViewController(detailView, animated: true)
            
        }
    }

    
}
