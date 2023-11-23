//
//  DetailViewController.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private lazy var detailCollectionView: UICollectionView = { createCollectionView() }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupLayout()
        setupCollectionViewConfig()
    }
}

// MARK: - Private Method

private extension DetailViewController {
    
    func setupViews() {
        self.navigationController?.isNavigationBarHidden = true
        view.addSubviews([detailCollectionView])
    }
    
    func setupLayout() {
        detailCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupCollectionViewConfig() {
        self.detailCollectionView.register(DetailMainSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailMainSectionHeaderView.identifier)
        
        self.detailCollectionView.register(DescriptionSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DescriptionSectionHeaderView.identifier)
        
        self.detailCollectionView.delegate = self
        self.detailCollectionView.dataSource = self
    }
    
    // MARK: - Create UI properties Method
    
    func createCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configLayout())
        collectionView.backgroundColor = UIColor.naverMapWhite
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }
    
    func createSectionHeader(forSection section: Int) -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(507))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        
        return header
    }
    
    // MARK: - Configure Layout Method
    
    func configLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            if sectionIndex == 0 || sectionIndex == 1 {
                return self.configHeaderSectionLayout(forSection: sectionIndex)
            } else {
                return nil // 나중에 config other section layout
            }
        }
    }
    
    func configHeaderSectionLayout(forSection section: Int) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(0)) // 아이템 없음
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let sectionLayout = NSCollectionLayoutSection(group: group)
        let header = createSectionHeader(forSection: section)
        sectionLayout.boundarySupplementaryItems = [header]
        return sectionLayout
    }
    
    // TODO: - 추후 레이아웃 구현

}

// MARK: - CollectionView DataSource

extension DetailViewController: UICollectionViewDataSource {    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 || section == 1 {
            return 0
        } else {
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
        }
        
        if indexPath.section == 0 {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailMainSectionHeaderView.identifier, for: indexPath) as? DetailMainSectionHeaderView else {
                return UICollectionReusableView()
            }
            return headerView
            
        } else if indexPath.section == 1 {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DescriptionSectionHeaderView.identifier, for: indexPath) as? DescriptionSectionHeaderView else {
                return UICollectionReusableView()
            }
            return headerView
            
        } else {
            return UICollectionReusableView()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
}

// MARK: - CollectionVeiw Delegate

extension DetailViewController: UICollectionViewDelegate {
    
}
