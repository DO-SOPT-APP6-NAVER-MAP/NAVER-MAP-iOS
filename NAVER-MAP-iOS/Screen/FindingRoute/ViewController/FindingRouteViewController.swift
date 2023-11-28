//
//  FindingRouteViewController.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

final class FindingRouteViewController: UIViewController {

    // MARK: - UI Properties

    private let rootView = FindingRouteRootView()

    // MARK: - Life Cycle

    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNavigationBar()
        setupView()
    }
}

private extension FindingRouteViewController {
    func setupView() {
        rootView.setupCollectionView(forDelegate: self, forDatasource: self)
    }
}

extension FindingRouteViewController: UICollectionViewDelegate { }

extension FindingRouteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FindingRouteCollectionViewCell.identifier, for: indexPath) as? FindingRouteCollectionViewCell else { return UICollectionViewCell() }
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
