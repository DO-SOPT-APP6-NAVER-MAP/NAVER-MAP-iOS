//
//  MainSearchViewModel.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 12/5/23.
//

import Foundation

final class MainSearchViewModel {
    
    // MARK: - Action
    
    typealias ChangeNormalAction = () -> ()
    private var changeTextFieldAction: ChangeNormalAction = { }

    
    // MARK: - Properties

    private var searchResultString: String = "" {
        didSet {
            fetchSearchResult(forText: searchResultString)
        }
    }
    private var searchNetworkData = [GetPlaceSearchResponseData]() {
        didSet {
//            rootView.reloadView()
        }
    }
    private var searchResultData = [MainSearchLocationModel]() {
        didSet {
            changeTextFieldAction()
        }
    }
    
    // MARK: - Life Cycle

    init() {
        fetchNetworkResult()
    }
}

// MARK: - Setup

extension MainSearchViewModel {
    func setupChangeTextFieldAction(action: @escaping ChangeNormalAction) {
        changeTextFieldAction = action
    }
    
    func refreshNetworkResult() {
        fetchNetworkResult()
    }
}

// MARK: - Data Processing

extension MainSearchViewModel {
    func setupTextField(forString: String) {
        searchResultString = forString
    }
    
    func fetchTextField() -> String {
        return searchResultString
    }
    
    func fetchSearchResultData() -> [MainSearchLocationModel] {
        return searchResultData
    }
    
    func fetchIndexOfSearchResultData(forIndex: Int) -> MainSearchLocationModel? {
        if searchResultData.count > forIndex {
            return searchResultData[forIndex]
        } else { return nil }
    }
}


// MARK: - private extension

private extension MainSearchViewModel {
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
