//
//  ViewController.swift
//  Compositional Layout
//
//  Created by OS on 30/06/24.
//

import UIKit

class ViewController: UIViewController {

    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        return cv
    }()
    
    let dataSourceTitle = ["Transfer Money", "Recharge and Paybills", "Sponsored Links", "Insurance", "Travel Bookings", "Switch"]
    
    let dataSource = ["HeaderImgTwo", "HeaderImgThree" , "HeaderImgSix", "HeaderImgOne", "HeaderImgFive", "HeaderImgFour"]

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.collectionView)
        self.setConstraintForCollectionView()
        self.registerCell()
        self.registerHeaderAndFooter()
        self.setupCompositionLayout()
    }

    
    func setConstraintForCollectionView() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
        
    }
    
    func registerCell(){
        collectionView.register(UINib.init(nibName: "MoneyTransferCvCell", bundle: nil),
                                forCellWithReuseIdentifier: "MoneyTransferCvCell")
        collectionView.register(UINib.init(nibName: "BannerCvCell", bundle: nil),
                                forCellWithReuseIdentifier: "BannerCvCell")
        collectionView.register(UINib.init(nibName: "QrCvCell", bundle: nil),
                                forCellWithReuseIdentifier: "QrCvCell")
        collectionView.register(UINib.init(nibName: "BlueTileCvCell", bundle: nil),
                                forCellWithReuseIdentifier: "BlueTileCvCell")
    }
    
    func registerHeaderAndFooter(){
        collectionView.register(UINib.init(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind:  UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
    }
    
    func setupCompositionLayout() {
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            case 0,5:
                return self.layoutForSectionFirst()
            case 1,4,6,7,8,9:
                return self.layoutForSectionSecond()
            case 2:
                return self.layoutForSectionThird()
            case 3:
                return self.layoutForSectionFour()
            default:
                return nil
            }
           
        }
        layout.register(BackgroundView.self, forDecorationViewOfKind: "BackgroundView")
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    func layoutForSectionFirst() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .fractionalHeight(1))
        let item =  NSCollectionLayoutItem.init(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets.set(leading: 16,trailing: 16)
     
        let section = NSCollectionLayoutSection.init(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.set(top: 16)
       
        section.orthogonalScrollingBehavior = .continuousGroupLeadingBoundary
        return section
        
    }
    
    func layoutForSectionSecond() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1/4),
                                                   heightDimension: .estimated(1))
        let item =  NSCollectionLayoutItem.init(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .estimated(2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets.set(trailing: 16)
        
        let section = NSCollectionLayoutSection.init(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.set(leading: 16,bottom: 0)
    
        let decorationItem = NSCollectionLayoutDecorationItem.background(elementKind: "BackgroundView")
        section.boundarySupplementaryItems = [
            .init(layoutSize: NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(76)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        ]
        section.decorationItems = [decorationItem]
        return section
    }
    
    func layoutForSectionThird() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1),
                                                   heightDimension: .estimated(1))
        let item =  NSCollectionLayoutItem.init(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .estimated(2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets.set(leading: 16, trailing: 16)
        let section = NSCollectionLayoutSection.init(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.set(top: 16,bottom: 16)
        return section
        
    }
    
    
    func layoutForSectionFour() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(0.31),
                                                   heightDimension: .estimated(1))
        let item =  NSCollectionLayoutItem.init(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize.init(widthDimension: .fractionalWidth(1),
                                                    heightDimension: .estimated(2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets.set(trailing: 16)
        group.interItemSpacing = .flexible(10)
        
        let section = NSCollectionLayoutSection.init(group: group)
        section.contentInsets = NSDirectionalEdgeInsets.set(leading: 16,bottom: 0)
        return section
        
    }
    


}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 || section == 5 {
            return 5
        } else if  section == 1 || section == 6 || section == 7 || section == 8 || section == 9 {
            return 4
        }  else if  section == 2 {
            return 1
        } else if  section == 3 {
            return 3
        } else {
            return 8
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0,5:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCvCell",for: indexPath) as? BannerCvCell {
                let imageName = dataSource[indexPath.item]
                cell.configureData(data: imageName)
                return cell
            }
            return UICollectionViewCell()
        case 1,4,6,7,8,9:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoneyTransferCvCell",for: indexPath) as? MoneyTransferCvCell {
                return cell
            }
            return UICollectionViewCell()
        case 2:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QrCvCell",for: indexPath) as? QrCvCell {
                return cell
            }
            return UICollectionViewCell()
        case 3:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlueTileCvCell",for: indexPath) as? BlueTileCvCell {
                return cell
            }
            return UICollectionViewCell()
        default:
            return UICollectionViewCell()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if [1, 4, 6, 7, 8, 9].contains(indexPath.section) {
                guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as? HeaderView else {
                    return UICollectionReusableView()
                }
                if indexPath.section < dataSourceTitle.count {
                               header.configureTitle(title: dataSourceTitle[indexPath.section])
                           }
                           return header
            }
        }
        return UICollectionReusableView()
    }
    
}

extension NSDirectionalEdgeInsets {
    static func set(top: CGFloat = 0, leading: CGFloat = .zero, bottom: CGFloat = .zero, trailing: CGFloat = .zero) ->  NSDirectionalEdgeInsets{
        return NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
}
