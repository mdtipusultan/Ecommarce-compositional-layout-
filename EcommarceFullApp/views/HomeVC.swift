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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        brands = TestData.shared.brandsData
        category = TestData.shared.categoryData
        
        createLayout()
        collectionView.register(CollectionViewHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ReusableView")

    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        print("ViewForSupplementaryElementOfKind: \(kind) Section: \(indexPath.section)")

        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ReusableView", for: indexPath) as! CollectionViewHeaderReusableView
            
            //header.setup(sections[indexPath.section].title)
            switch indexPath.section {
            case 1:
                header.title.text = "fvnjenvj"
                header.viewAllButton.setTitle("See All >>", for: .normal)
                
            case 2: // Section 2: Categories
                header.title.text = "frrjdcdenvj"
                header.viewAllButton.setTitle("See All >>", for: .normal)
                
            default:
                header.title.text = ""
                header.viewAllButton.setTitle("", for: .normal)
            }
            
            return header
        }
        //default:
            return UICollectionReusableView()
        
    }
    

    func createLayout(){
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) in
            if sectionIndex == 0 {
                // Section 1: Hello, welcome, and search bar
                return self.createFirstSectionLayout()
            } else if sectionIndex == 1 {
                // Section 2: Horizontal scrolling logo and logo name
                return self.createSecondSectionLayout()
            } else {
                // Section 3: Product image, icon, name, and price
                return self.createThirdSectionLayout()
            }
        }
        
        collectionView.collectionViewLayout = layout
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
        
        section.boundarySupplementaryItems = [
            .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: "categoryHeaderId", alignment: .topLeading)
        ]
        
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
    
    
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        let size = CGSize(width: self.collectionView.bounds.width, height: 50)
        return size
        
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Return the size for the item at the specified indexPath
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

 
    //@objc (collectionView:viewForSupplementaryElementOfKind:atIndexPath:)
    
    
        /*
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        switch section {
        case 0: // Section 1: Products
            return CGSize(width: collectionView.frame.width, height: 0) // Set the height to 0
        default:
            return CGSize(width: collectionView.frame.width, height: 50) // Set the height for other sections
        }
    }
    
    */
}
