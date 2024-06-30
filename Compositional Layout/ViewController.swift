import UIKit

class ViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        return cv
    }()
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        setConstraintForCollectionView()
        registerCells()
        registerHeaderAndFooter()
        setupCompositionLayout()
    }
    
    func setConstraintForCollectionView() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func registerCells() {
        collectionView.register(UINib(nibName: "MoneyTransferCvCell", bundle: nil), forCellWithReuseIdentifier: "MoneyTransferCvCell")
        collectionView.register(UINib(nibName: "BannerCvCell", bundle: nil), forCellWithReuseIdentifier: "BannerCvCell")
        collectionView.register(UINib(nibName: "QrCvCell", bundle: nil), forCellWithReuseIdentifier: "QrCvCell")
        collectionView.register(UINib(nibName: "BlueTileCvCell", bundle: nil), forCellWithReuseIdentifier: "BlueTileCvCell")
    }
    
    func registerHeaderAndFooter() {
        collectionView.register(UINib(nibName: "HeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderView")
    }
    
    func setupCompositionLayout() {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, environment in
            switch sectionIndex {
            case 0, 5:
                return self.layoutForSectionFirst()
            case 1, 4, 6, 7, 8, 9:
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

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0, 5:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCvCell", for: indexPath) as? BannerCvCell {
                if let imageName = viewModel.imageNameForSection(indexPath.section, at: indexPath.item) {
                    cell.configureData(data: imageName)
                }
                return cell
            }
        case 1:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoneyTransferCvCell", for: indexPath) as? MoneyTransferCvCell {
                if let imageName = viewModel.imageNameForSection(indexPath.section, at: indexPath.item) {
                    cell.configure(image: imageName)
                }
                return cell
            }
        case 4, 6, 7, 8, 9:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoneyTransferCvCell", for: indexPath) as? MoneyTransferCvCell {
                if let imageName = viewModel.imageNameForSection(indexPath.section, at: indexPath.item) {
                    cell.configure(image: imageName)
                }
                return cell
            }
        case 2:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "QrCvCell", for: indexPath) as? QrCvCell {
                return cell
            }
        case 3:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BlueTileCvCell", for: indexPath) as? BlueTileCvCell {
                return cell
            }
        default:
            break
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView", for: indexPath) as? HeaderView {
                if let title = viewModel.titleForSection(indexPath.section) {
                    headerView.configureTitle(title: title)
                }
                return headerView
            }
        }
        return UICollectionReusableView()
    }
}

