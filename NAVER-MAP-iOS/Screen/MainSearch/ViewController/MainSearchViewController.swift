//
//  MainSearchViewController.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

final class MainSearchViewController: UIViewController {
    
    // MARK: - Properties

    private var searchResultString: String = ""
    private var searchNetworkData = [GetPlaceSearchResponseData]() {
        didSet {
            rootView.reloadView()
        }
    }
    private var searchResultData = [MainSearchLocationModel]() {
        didSet {
            rootView.reloadView()
        }
    }
    
    private let collectionViewItemSpacing: CGFloat = 8
    private let collectionViewHorizontalInset: CGFloat = 16
    
    // MARK: - UI Properties

    private let rootView = MainSearchRootView()

    // MARK: - Life Cycle

    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNavigationBar()
        hideKeyboard()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchNetworkResult()
    }
}

// MARK: - private extension

private extension MainSearchViewController {
    func setupView() {
        rootView.setupCollectionView(forDelegate: self, forDatasource: self)
        rootView.setupTableView(forDelegate: self, forDatasource: self)
        rootView.setupTextField(forDelegate: self)
    }
    
    func fetchNetworkResult() {
        NetworkService.shared.placeService.getPlaceSearch(forPlaceName: "알고") { result in
            switch result {
            case .success(let response):
                if let responseData = response?.data {
                    self.searchNetworkData = responseData
                }
            default: break
            }
        }
    }
    
    func fetchSearchResult(forText: String) {
        var data = [MainSearchLocationModel]()
        
        searchNetworkData.forEach {
            if $0.name.contains(forText) {
                data.append(MainSearchLocationModel(locationId: $0.placeId,
                                                    locationName: $0.name,
                                                    location: $0.detailAddress,
                                                    reviewCount: $0.visitorReview,
                                                    category: $0.category,
                                                    distance: $0.distance))
            }
        }
        searchResultData = data
    }
}

// MARK: - UITextFieldDelegate

extension MainSearchViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let originText = textField.text else { return }
        searchResultString = originText
        fetchSearchResult(forText: originText)
    }
}

// MARK: - UICollectionViewDelegate

extension MainSearchViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource

extension MainSearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchResultData.count > 4 {
            return 4
        } else {
            return searchResultData.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchRecommendCollectionViewCell.identifier, for: indexPath) as? SearchRecommendCollectionViewCell else { return UICollectionViewCell() }
        cell.configCell(forName: searchResultData[indexPath.item].locationName, forSearch: searchResultString)
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
        // TODO: - 화면 전환 (id값 전달)
        let searchResultVC = SearchResultViewController()
        print(searchResultData[indexPath.row].locationId)
    }
}

// MARK: - UITableViewDataSource

extension MainSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchResultData.count == 0 {
            if searchResultString == "" {
                rootView.setupEmptyView(isHide: false)
            } else {
                rootView.setupEmptyView(isHide: false, isEmpty: false)
            }
        } else {
            rootView.setupEmptyView(isHide: true)
        }
        return searchResultData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.identifier, for: indexPath) as? SearchResultTableViewCell else { return UITableViewCell() }
        cell.configCell(forModel: searchResultData[indexPath.row], forSearch: searchResultString)
        return cell
    }
}

