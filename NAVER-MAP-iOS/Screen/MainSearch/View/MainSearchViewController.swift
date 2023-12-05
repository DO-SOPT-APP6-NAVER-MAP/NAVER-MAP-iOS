//
//  MainSearchViewController.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

import SnapKit
import Then

final class MainSearchViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel: MainSearchViewModel = MainSearchViewModel()
    
    private let collectionViewItemSpacing: CGFloat = 8
    private let collectionViewHorizontalInset: CGFloat = 16
    
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
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNavigationBar()
        hideKeyboard()
        setupStyle()
        setupLayout()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.refreshNetworkResult()
    }
}

// MARK: - private extension

private extension MainSearchViewController {
    
    func setupViewModel() {
        viewModel.setupChangeTextFieldAction {
            self.recommendCollectionView.reloadData()
            self.resultTableView.reloadData()
        }
    }
    
    func setupEmptyView(isHide: Bool, isEmpty: Bool = true) {
        emptyResultView.isHidden = isHide
        emptyResultView.setupLabel(forEmpty: isEmpty)
    }
    
    func setupStyle() {
        view.backgroundColor = .naverMapWhite
        
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
            $0.delegate = self
        }
        
        searchTopCancleBtn.do {
            $0.setImage(ImageLiterals.ic_remove, for: .normal)
        }
        
        recommendCollectionView.do {
            $0.register(SearchRecommendCollectionViewCell.self, forCellWithReuseIdentifier: SearchRecommendCollectionViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
            $0.isScrollEnabled = false
            
            $0.contentInset = .init(top: 12, left: 16, bottom: 12, right: 16)
        }
        
        resultTableView.do {
            $0.register(SearchResultTableViewCell.self, forCellReuseIdentifier: SearchResultTableViewCell.identifier)
            $0.delegate = self
            $0.dataSource = self
            $0.showsVerticalScrollIndicator = false
            $0.rowHeight = 91
        }
        
        dividingView.do {
            $0.backgroundColor = .naverMapBlueGray2
        }
    }
    
    func setupLayout() {
        view.addSubviews([recommendCollectionView,
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
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        searchTopView.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.top.equalTo(view.safeAreaLayoutGuide)
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
            $0.width.equalTo(view.convertByWidthRatio(278))
        }
    }
}

// MARK: - UITextFieldDelegate

extension MainSearchViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let originText = textField.text else { return }
        viewModel.setupTextField(forString: originText)
    }
}

// MARK: - UICollectionViewDelegate

extension MainSearchViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource

extension MainSearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dataCount = viewModel.fetchSearchResultData().count
        if dataCount > 4 {
            return 4
        } else {
            return dataCount
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchRecommendCollectionViewCell.identifier, for: indexPath) as? SearchRecommendCollectionViewCell else { return UICollectionViewCell() }
        if let data = viewModel.fetchIndexOfSearchResultData(forIndex: indexPath.item) {
            cell.configCell(forName: data.locationName, forSearch: viewModel.fetchTextField())
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainSearchViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (view.getDeviceWidth() - 2 * collectionViewHorizontalInset - collectionViewItemSpacing) / 2
        return .init(width: width, height: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return collectionViewItemSpacing
    }
}

// MARK: - UITableViewDelegate

extension MainSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let data = viewModel.fetchIndexOfSearchResultData(forIndex: indexPath.item) {
            let searchResultVC = SearchResultViewController(forPlaceId: data.locationId, forPlaceName: data.locationName)
            self.navigationController?.pushViewController(searchResultVC, animated: true)
        }
    }
}

// MARK: - UITableViewDataSource

extension MainSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let dataCount = viewModel.fetchSearchResultData().count
        
        if dataCount == 0 {
            if viewModel.fetchTextField() == "" {
                setupEmptyView(isHide: false)
            } else {
                setupEmptyView(isHide: false, isEmpty: false)
            }
        } else {
            setupEmptyView(isHide: true)
        }
        return dataCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell else { return UITableViewCell() }
        // TODO: - View에서 Model을 모르도록 수정
        if let data = viewModel.fetchIndexOfSearchResultData(forIndex: indexPath.item) {
            cell.configCell(forModel: data, forSearch: viewModel.fetchTextField())
        }
        return cell
    }
}

