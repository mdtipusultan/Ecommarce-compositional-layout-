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
        
        createCompositionalLayout()

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
        // Define layout for the first section with vertical arrangement
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(100))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 3)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        
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
        // Define layout for the third section with vertical arrangement
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.3))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .estimated(1000))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, repeatingSubitem: item, count: 4)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .continuous
        
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
            //if indexPath.section != 0 {
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

}
