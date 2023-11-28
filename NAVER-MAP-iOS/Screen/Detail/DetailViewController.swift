//
//  DetailViewController.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MARK: Dummy Datas
    
    private var menuDummy = DetailMenuData.detailMenuDummy
    private var visitorReviewDummy = DetailVisitorReviewData.detailVisitorDummy
    private var blogReviewDummy = DetailBlogData.detailBlogData
    
    // MARK: - UI Properties
    
    private lazy var detailCollectionView: UICollectionView = { createCollectionView() }()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setupCollectionViewConfig()
    }
}

// MARK: - Private Method

private extension DetailViewController {
    
    func setupViews() {
        self.view.backgroundColor = .naverMapGray1
        self.navigationController?.isNavigationBarHidden = true
        view.addSubviews([detailCollectionView])
    }
    
    func setupConstraints() {
        detailCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupCollectionViewConfig() {
        self.detailCollectionView.register(DetailMainSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DetailMainSectionHeaderView.identifier)
        
        self.detailCollectionView.register(DescriptionSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: DescriptionSectionHeaderView.identifier)
        
        self.detailCollectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        
        self.detailCollectionView.register(MenuSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MenuSectionHeaderView.identifier)
        
        self.detailCollectionView.register(SectionFooterView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: SectionFooterView.identifier)
        
        self.detailCollectionView.register(VisitorReviewCollectionViewCell.self, forCellWithReuseIdentifier: VisitorReviewCollectionViewCell.identifier)
        
        self.detailCollectionView.register(VisitorSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: VisitorSectionHeaderView.identifier)
        
        self.detailCollectionView.register(BlogReviewCollectionViewCell.self, forCellWithReuseIdentifier: BlogReviewCollectionViewCell.identifier)
        
        self.detailCollectionView.register(BlogSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: BlogSectionHeaderView.identifier)
        
        self.detailCollectionView.register(LinksSectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: LinksSectionHeaderView.identifier)
        
        self.detailCollectionView.delegate = self
        self.detailCollectionView.dataSource = self
    }
    
    // MARK: - Create UI properties Method
    
    func createCollectionView() -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configLayout())
        collectionView.backgroundColor = .naverMapWhite
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }
    
    func createMainSectionHeader(forSection section: Int) -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(500))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return header
    }
    
    func createHeader(forSection section: Int) -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(54))
        let layout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layout
    }
    
    func createVisitorSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(221))
        let layout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layout
    }
    
    func createLinksSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(281))
        let layout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        return layout
    }
    
    func createFooter(forSection section: Int) -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(90))
        let layout = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: layoutSize, elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        return layout
    }
    
    // MARK: - Configure Layout Method
    
    func configLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            switch sectionIndex {
            case 0, 1:
                return self.configMainSectionLayout(forSection: sectionIndex)
            case 2:
                return self.configMenuSectionLayout()
            case 3:
                return self.configVisitorReviewSectionLayout()
            case 4:
                return self.configBlogReviewSectionLayout()
            case 5:
                return self.configLinnksSectionLayout()
            default:
                return nil
            }
        }
    }
    
    func configMainSectionLayout(forSection section: Int) -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), 
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(0)) // 아이템 없음
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let sectionLayout = NSCollectionLayoutSection(group: group)
        let header = createMainSectionHeader(forSection: section)
        sectionLayout.boundarySupplementaryItems = [header]
    
        return sectionLayout
    }
    
    func configMenuSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/2), 
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(235))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)

        let sectionLayout = NSCollectionLayoutSection(group: group)
        sectionLayout.interGroupSpacing = 16
        
        let header = createHeader(forSection: 2)
        let footer = createFooter(forSection: 2)
        sectionLayout.boundarySupplementaryItems = [header, footer]

        return sectionLayout
    }
    
    func configVisitorReviewSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(146))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let sectionLayout = NSCollectionLayoutSection(group: group)
        let header = createVisitorSectionHeader()
        let footer = createFooter(forSection: 3)
        sectionLayout.boundarySupplementaryItems = [header, footer]
        return sectionLayout
    }
    
    func configBlogReviewSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(154))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.contentInsets = .init(top: 0, leading: 16, bottom: 0, trailing: 16)
        
        let sectionLayout = NSCollectionLayoutSection(group: group)
        let header = createHeader(forSection: 4)
        let footer = createFooter(forSection: 4)
        sectionLayout.boundarySupplementaryItems = [header, footer]
        return sectionLayout
    }
    
    func configLinnksSectionLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(0)) // 아이템 없음
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let sectionLayout = NSCollectionLayoutSection(group: group)
        let header = createLinksSectionHeader()
        sectionLayout.boundarySupplementaryItems = [header]
    
        return sectionLayout
    }
}

// MARK: - CollectionView DataSource

extension DetailViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {

        case 2:
            return menuDummy.count
        case 3:
            return visitorReviewDummy.count
        case 4:
            return blogReviewDummy.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        case 2:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell else { return UICollectionViewCell() }
            item.bindData(data: menuDummy[indexPath.row])
            return item
            
        case 3:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: VisitorReviewCollectionViewCell.identifier, for: indexPath) as? VisitorReviewCollectionViewCell else { return UICollectionViewCell() }
            item.bindData(data: visitorReviewDummy[indexPath.row])
            return item
            
        case 4:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: BlogReviewCollectionViewCell.identifier, for: indexPath) as? BlogReviewCollectionViewCell else { return UICollectionViewCell() }
            item.bindData(data: blogReviewDummy[indexPath.row])
            return item
            
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            
        case UICollectionView.elementKindSectionHeader:
            switch indexPath.section {
                
            case 0:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DetailMainSectionHeaderView.identifier, for: indexPath) as? DetailMainSectionHeaderView else { return UICollectionReusableView() }
                return headerView
                
            case 1:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DescriptionSectionHeaderView.identifier, for: indexPath) as? DescriptionSectionHeaderView else { return UICollectionReusableView() }
                return headerView
                
            case 2:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MenuSectionHeaderView.identifier, for: indexPath) as? MenuSectionHeaderView else { return UICollectionReusableView() }
                return headerView
                
            case 3:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: VisitorSectionHeaderView.identifier, for: indexPath) as? VisitorSectionHeaderView else { return UICollectionReusableView() }
                return headerView
                
            case 4:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BlogSectionHeaderView.identifier, for: indexPath) as? BlogSectionHeaderView else { return UICollectionReusableView() }
                return headerView
                
            case 5:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: LinksSectionHeaderView.identifier, for: indexPath) as? LinksSectionHeaderView else { return UICollectionReusableView() }
                headerView.delegate = self
                return headerView
                
            default:
                return UICollectionReusableView()
            }
            
        case UICollectionView.elementKindSectionFooter:
            switch indexPath.section {
                
            case 2:
                guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionFooterView.identifier, for: indexPath) as? SectionFooterView else { return UICollectionReusableView() }
                footerView.setLabelText(LabelText: "메뉴 더보기")
                return footerView
                
            case 3:
                guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionFooterView.identifier, for: indexPath) as? SectionFooterView else { return UICollectionReusableView() }
                footerView.setLabelText(LabelText: "방문자 리뷰 더보기")
                return footerView
                
            case 4:
                guard let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionFooterView.identifier, for: indexPath) as? SectionFooterView else { return UICollectionReusableView() }
                footerView.setLabelText(LabelText: "블로그 리뷰 더보기")
                return footerView
                
            default:
                return UICollectionReusableView()
            }
            
        default:
            return UICollectionReusableView()
        }
    }
}

// MARK: - CollectionVeiw Delegate

extension DetailViewController: UICollectionViewDelegate { }

// MARK: - LinksSectionHeaderDelegate

extension DetailViewController: LinksSectionHeaderViewDelegate {
    func scrollToTop() {
        detailCollectionView.setContentOffset(CGPoint.zero, animated: true)
    }
}
