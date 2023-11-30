//
//  FindingRouteViewController.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

final class FindingRouteViewController: UIViewController {
    
    // MARK: - Properties

    private var placdId: Int
    private var placeName: String 
    private var routeData: [FindingRouteModel] = [FindingRouteModel]() {
        didSet {
            rootView.reloadCollectionView()
        }
    }

    // MARK: - UI Properties

    private let rootView = FindingRouteRootView()

    // MARK: - Life Cycle
    
    init(forPlacdId: Int, forPlaceName: String) {
        self.placdId = 1
        self.placeName = forPlaceName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNavigationBar()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        fetchNetworkResult()
    }
}

// MARK: - private extension

private extension FindingRouteViewController {
    func setupView() {
        rootView.setupCollectionView(forDelegate: self, forDatasource: self)
        rootView.setupArriveText(forText: placeName)
    }
    
    func fetchNetworkResult() {
        NetworkService.shared.placeService.getPlaceRoute(forPlaceId: placdId) { result in
            switch result {
            case .success(let response):
                if let data = response?.data {
                    var routeNetworkData = [FindingRouteModel]()
                    data.directionLists.forEach {
                        routeNetworkData.append(FindingRouteModel(imageURL: $0.route))
                    }
                    self.routeData = routeNetworkData
                }
            default: break
            }
        }
    }
}

// MARK: - UICollectionViewDelegate

extension FindingRouteViewController: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension FindingRouteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return routeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FindingRouteCollectionViewCell.identifier, for: indexPath) as? FindingRouteCollectionViewCell else { return UICollectionViewCell() }
        cell.configCell(forURL: routeData[indexPath.item].imageURL)
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FindingRouteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.getDeviceWidth(), height: 237)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
