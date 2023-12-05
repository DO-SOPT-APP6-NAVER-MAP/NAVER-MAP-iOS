//
//  MainSearchViewController.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

final class MainSearchViewController: UIViewController {
    
    // MARK: - Properties
    
    private let viewModel: MainSearchViewModel = MainSearchViewModel()
    
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
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.refreshNetworkResult()
    }
}

// MARK: - private extension

private extension MainSearchViewController {
    func setupView() {
        rootView.setupCollectionView(forDelegate: self, forDatasource: self)
        rootView.setupTableView(forDelegate: self, forDatasource: self)
        rootView.setupTextField(forDelegate: self)
    }
    
    func setupViewModel() {
        viewModel.setupChangeTextFieldAction {
            self.rootView.reloadView()
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
                rootView.setupEmptyView(isHide: false)
            } else {
                rootView.setupEmptyView(isHide: false, isEmpty: false)
            }
        } else {
            rootView.setupEmptyView(isHide: true)
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

