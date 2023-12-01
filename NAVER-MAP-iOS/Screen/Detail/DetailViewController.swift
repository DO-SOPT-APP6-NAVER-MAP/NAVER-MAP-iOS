//
//  DetailViewController.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

import SnapKit
import Then

class DetailViewController: UIViewController {
    
    private var detailData : GetPlaceResultDetailResponseDTO?
    
    // MARK: Dummy Datas
    
    private var menuData : [MenuInfo] = []
    private var visitorData : [ReviewInfo] = []
    private var blogData : [ReviewInfo] = []
    
    // MARK: - ID
    
    private var placeId: Int
    private var placeName: String

    // MARK: - Initializer
    
    init(forPlaceId: Int, forPlaceName: String) {
        self.placeId = forPlaceId
        self.placeName = forPlaceName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Properties
    
    private lazy var detailCollectionView: UICollectionView = { createCollectionView() }()
    private let detailTopHeader = DetailTopHeaderView()
    private let descriptionHeader = DescriptionTopHeaderView()
    private let mainSection = DetailMainSectionHeaderView()
    private let descriptionSection = DescriptionSectionHeaderView()
    private let menuSection = MenuCollectionViewCell()
    private let visitorSectionHeader = VisitorSectionHeaderView()
    private let visitorSection = VisitorReviewCollectionViewCell()
    private let blogSectionHeader = BlogSectionHeaderView()
    private let blogSection = BlogReviewCollectionViewCell()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        setupCollectionViewConfig()
        getPlaceResultDetail()
    }
}

// MARK: - Private Method

private extension DetailViewController {
    
    // MARK: - Network
    
    func getPlaceResultDetail() {
        NetworkService.shared.placeService.getPlaceResultDetail(forPlaceId: placeId, completion: {
            (response) in
            switch response {
            case .success(let response):
                if let data = response {
                    self.detailData = data
                    self.detailTopHeader.locationName.text = data.data.name
                    self.menuData = data.data.menuInfos
                    self.visitorData = data.data.visitorReviewInfos
                    self.blogData = data.data.blogReviewInfos
                }
                self.detailCollectionView.reloadData()
    
            case .requestErr :
                print("requestErr")
            case .serverErr:
                print("serverErr")
            case .networkFail:
                print("networkFail")
            case .decodeErr:
                print("decodeErr")
            }
        })
    }
    
    func setupViews() {
        self.view.backgroundColor = .naverMapGray1
        self.navigationController?.isNavigationBarHidden = true
        view.addSubviews([detailCollectionView, detailTopHeader, descriptionHeader])
    }
    
    func setupConstraints() {
        detailCollectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        detailTopHeader.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
        }
        
        descriptionHeader.snp.makeConstraints {
            $0.top.equalTo(detailTopHeader.snp.bottom)
            $0.leading.trailing.equalToSuperview()
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
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(510))
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
            return menuData.count
        case 3:
            return visitorData.count
        case 4:
            return blogData.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            
        case 2:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell else { return UICollectionViewCell() }
            //            item.bindData(data: menuDummy[indexPath.row])
            item.bindData(data: menuData[indexPath.row])
            return item
            
        case 3:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: VisitorReviewCollectionViewCell.identifier, for: indexPath) as? VisitorReviewCollectionViewCell else { return UICollectionViewCell() }
            item.bindData(data: visitorData[indexPath.row])
            return item
            
        case 4:
            guard let item = detailCollectionView.dequeueReusableCell(withReuseIdentifier: BlogReviewCollectionViewCell.identifier, for: indexPath) as? BlogReviewCollectionViewCell else { return UICollectionViewCell() }
            item.bindData(data: blogData[indexPath.row])
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
                headerView.delegate = self
                if let detailData {
                    headerView.bindData(data: detailData)
                }
                return headerView
                
            case 1:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: DescriptionSectionHeaderView.identifier, for: indexPath) as? DescriptionSectionHeaderView else { return UICollectionReusableView() }
                if let detailData {
                    headerView.bindData(data: detailData)
                }
                return headerView
                
            case 2:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: MenuSectionHeaderView.identifier, for: indexPath) as? MenuSectionHeaderView else { return UICollectionReusableView() }
                return headerView
                
            case 3:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: VisitorSectionHeaderView.identifier, for: indexPath) as? VisitorSectionHeaderView else { return UICollectionReusableView() }
                headerView.configHeaderView(forCount: String(visitorData.count))
                return headerView
                
            case 4:
                guard let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: BlogSectionHeaderView.identifier, for: indexPath) as? BlogSectionHeaderView else { return UICollectionReusableView() }
                headerView.configHeaderView(forCount: String(blogData.count))
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

extension DetailViewController: UICollectionViewDelegate {
    
    /// 스크롤 이벤트에 반응하는 메서드
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let visibleDescriptionHeaderOffsetY: CGFloat = 503 - 40 // safeArea까지의 거리와 topHeader Height의 차이
        
        if offsetY > 0 {
            detailTopHeader.isHidden = false
            let alpha = min((offsetY - 0) / 60, 1) // y가 0~60일 때, 투명도 조절
            detailTopHeader.alpha = alpha
        } else {
            detailTopHeader.isHidden = true
        }
        
        descriptionHeader.isHidden = offsetY <= visibleDescriptionHeaderOffsetY
    }
}

// MARK: - LinksSectionHeaderDelegate

extension DetailViewController: LinksSectionHeaderViewDelegate {
    func scrollToTop() {
        detailCollectionView.setContentOffset(CGPoint.zero, animated: true)
    }
}

extension DetailViewController: MainSectionHeaderViewDelegate {
    
    func scrollToSection(section: Int) {
        guard let layoutAttributes = detailCollectionView.layoutAttributesForSupplementaryElement(ofKind: UICollectionView.elementKindSectionHeader, at: IndexPath(item: 0, section: section)) else {
            return
        }
        
        let headerHeight = CGFloat(48 + 45) // 두 헤더의 높이 합
        let headerTop = layoutAttributes.frame.origin.y
        detailCollectionView.setContentOffset(CGPoint(x: 0, y: headerTop - detailCollectionView.contentInset.top - headerHeight), animated: true)
    }

    func moveToFindingRouteVC() {
        let findingRouteVC = FindingRouteViewController(forPlacdId: self.placeId, forPlaceName: self.placeName)
        self.navigationController?.pushViewController(findingRouteVC, animated: true)
    }
    
    func moveToSearchResultVC() {
        let searchResultVC = SearchResultViewController(forPlaceId: self.placeId, forPlaceName: self.placeName)
        self.navigationController?.pushViewController(searchResultVC, animated: true)
    }
    
    func scrollToVisitorSection() {
        scrollToSection(section: 3)
    }
    
    func scrollToBlogSection() {
        scrollToSection(section: 4)
    }
    
    func goToFindingRouteVC() {
        moveToFindingRouteVC()
    }
    
    func goToSearchResultVC() {
        moveToSearchResultVC()
    }
}
