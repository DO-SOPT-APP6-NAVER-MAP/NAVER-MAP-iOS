//
//  MainSearchRootView.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/25/23.
//

import UIKit

import SnapKit
import Then

final class MainSearchRootView: UIView {
    
    // MARK: - UI Properties
    
    private let searchTopView: UIView = UIView()
    private let searchTopStackView: UIStackView = UIStackView()
    private let searchTopBackBtn: UIButton = UIButton()
    private let searchTopTextField: UITextField = UITextField()
    private let searchTopCancleBtn: UIButton = UIButton()
    
    private let emptyResultView: EmptySearchView = EmptySearchView()
    
    private let recommendCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private let dividingView: UIView = UIView()
    private let resultTableView: UITableView = UITableView()
    
    // MARK: - View Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - setup View Method

extension MainSearchRootView {
    func setupCollectionView(forDelegate: UICollectionViewDelegate,
                             forDatasource: UICollectionViewDataSource) {
        recommendCollectionView.delegate = forDelegate
        recommendCollectionView.dataSource = forDatasource
    }
    
    func setupTableView(forDelegate: UITableViewDelegate,
                        forDatasource: UITableViewDataSource) {
        resultTableView.delegate = forDelegate
        resultTableView.dataSource = forDatasource
    }
    
    func setupTextField(forDelegate: UITextFieldDelegate) {
        searchTopTextField.delegate = forDelegate
    }
    
    func setupEmptyView(isHide: Bool, isEmpty: Bool = true) {
        emptyResultView.isHidden = isHide
        emptyResultView.setupLabel(forEmpty: isEmpty)
    }
    
    func reloadView() {
        recommendCollectionView.reloadData()
        resultTableView.reloadData()
    }
}

// MARK: - Private Extension

private extension MainSearchRootView {
    
    func setupStyle() {
        
        backgroundColor = .naverMapWhite
        
        searchTopView.do {
            $0.backgroundColor = .naverMapWhite
            $0.layer.shadowOffset = CGSize(width: 0, height: 0.5)
            $0.layer.shadowOpacity = 0.6
            $0.layer.shadowRadius = 1
            $0.layer.shadowColor = UIColor.naverMapGray4.cgColor
        }
        
        searchTopStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.alignment = .center
        }
        
        searchTopBackBtn.do {
            $0.setImage(ImageLiterals.ic_arrow_left_and, for: .normal)
        }
        
        searchTopTextField.do {
            $0.makeRounded(radius: 10)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.naverMapGray2.cgColor
            $0.addPadding(left: 12, right: 12)
        }
        
        searchTopCancleBtn.do {
            $0.setImage(ImageLiterals.ic_remove, for: .normal)
        }
        
        recommendCollectionView.do {
            $0.register(SearchRecommendCollectionViewCell.self, forCellWithReuseIdentifier: SearchRecommendCollectionViewCell.identifier)
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.isScrollEnabled = false
            
            $0.contentInset = .init(top: 12, left: 16, bottom: 12, right: 16)
        }
        
        resultTableView.do {
            $0.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
            $0.showsVerticalScrollIndicator = false
            $0.rowHeight = 91
        }
        
        dividingView.do {
            $0.backgroundColor = .naverMapBlueGray2
        }
    }
    
    func setupLayout() {
        addSubviews([recommendCollectionView,
                     dividingView,
                     resultTableView,
                     emptyResultView,
                     searchTopView])
        searchTopView.addSubview(searchTopStackView)
        searchTopStackView.addArrangedSubviews(searchTopBackBtn,
                                               searchTopTextField,
                                               searchTopCancleBtn)
        
        recommendCollectionView.snp.makeConstraints {
            $0.height.equalTo(112)
            $0.top.equalTo(searchTopView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        
        dividingView.snp.makeConstraints {
            $0.height.equalTo(6)
            $0.top.equalTo(recommendCollectionView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        
        resultTableView.snp.makeConstraints {
            $0.top.equalTo(dividingView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        searchTopView.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        emptyResultView.snp.makeConstraints {
            $0.edges.bottom.equalToSuperview()
        }
        
        searchTopStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        searchTopTextField.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(convertByWidthRatio(278))
        }
    }
}
