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
    
    var productImages = [UIImage(named: "Rectangle 575"), UIImage(named: "Rectangle 576"), UIImage(named: "Rectangle 577"), UIImage(named: "Rectangle 578")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.contentInsetAdjustmentBehavior = .never
     
        collectionView.delegate = self
        collectionView.dataSource = self
        
        tabBarController?.tabBar.isHidden = true
        
        cellRegisttration()
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    //MARK: CompositionalLayout
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            return self.createSection(for: sectionIndex)
        }
        return layout
    }
    func createSection(for sectionIndex: Int) -> NSCollectionLayoutSection {
        switch sectionIndex {
        case 0:
            // Customize layout for the first section
            return createFirstSectionLayout()
        case 1:
            // Customize layout for the second section
            return createSecondSectionLayout()
        case 2:
            // Customize layout for the third section
            return createThirdSectionLayout()
        case 3:
            // Customize layout for the fourth section
            return createFourthSectionLayout()
        case 4:
            // Customize layout for the fifth section
            return createFifthSectionLayout()
        case 5:
            // Customize layout for the sixth section
            return createSixthSectionLayout()
        default:
            return createDefaultSectionLayout()
        }
    }
    func createFirstSectionLayout() -> NSCollectionLayoutSection {
        // Customize layout for the first section
        
        //let ScreenHeight = MyHelper.shared.screenHeight
        //let sectionTop = 402 * (ScreenHeight / 1073.0)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(418))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    func createSecondSectionLayout() -> NSCollectionLayoutSection {
            
        // Customize layout for the first section
        
        //let ScreenHeight = MyHelper.shared.screenHeight
        //let sectionTop = 402 * (ScreenHeight / 1073.0)
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(46))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        /*
        // Add header with overlap
           let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(150))
           let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
           header.zIndex = 200 // Set zIndex to bring the header to the front
           section.boundarySupplementaryItems = [header]
        */
        section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20)
        
        return section
    }

    
    func createThirdSectionLayout() -> NSCollectionLayoutSection {
        // Customize layout for the second section
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .estimated(77))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(77))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous

        
        // Customize other section-specific properties here
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 0, trailing: 20)
        return section
    }
    
    func createFourthSectionLayout() -> NSCollectionLayoutSection {
        // Customize layout for the first section
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none

        // Customize other section-specific properties here

        return section
    }
    
    func createFifthSectionLayout() -> NSCollectionLayoutSection {
        // Customize layout for the first section
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none

        // Customize other section-specific properties here

        return section
    }
    
    func createSixthSectionLayout() -> NSCollectionLayoutSection {
        // Customize layout for the first section
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none

        // Customize other section-specific properties here

        return section
    }
    
    func createDefaultSectionLayout() -> NSCollectionLayoutSection {
        // This layout will be used for sections that don't have a specific layout defined
        return createFirstSectionLayout()
    }
    //MARK: CELL REGISTRATION
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
            return 1// Section 2
        }
        else if section == 2 {
            return productImages.count  // Section 3
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
            // Section 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell200", for: indexPath) as! secondCollectionViewCell
            
           
            
            return cell
        }
        
        else if indexPath.section == 2 {
            // Section 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell300", for: indexPath) as! thirdCollectionViewCell
            
            cell.configure(image: productImages[indexPath.item]!)
            return cell
        }
        
        else if indexPath.section == 3 {
            // Section 4:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell400", for: indexPath) as! forthCollectionViewCell
            
            return cell
        }
        
        if indexPath.section == 4 {
            // Section 5:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell500", for: indexPath) as! fifthCollectionViewCell
            
            return cell
        }
        
        else {
            // Section 6:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell600", for: indexPath) as! sixthCollectionViewCell
            
            
            return cell
        }
    }
}
