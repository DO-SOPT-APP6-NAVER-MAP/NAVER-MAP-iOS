//
//  SearchRecommendCollectionViewCell.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/26/23.
//

import UIKit

import SnapKit
import Then

final class SearchRecommendCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "SearchRecommendCollectionViewCell"
    
    // MARK: - UI Properties

    private let searchImageView: UIImageView = UIImageView(image: ImageLiterals.ic_search)
    private let searchRecommendLabel: UILabel = UILabel()
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Func

extension SearchRecommendCollectionViewCell {
    
    func configCell(forName: String, forSearch: String) {
        searchRecommendLabel.text = forName
        searchRecommendLabel.textColor = .naverMapBlack
        searchRecommendLabel.highlightText(forText: forSearch, forColor: .naverMapBlue)
    }
}

// MARK: - Private Extension

private extension SearchRecommendCollectionViewCell {
    
    func setupStyle() {
        backgroundColor = .naverMapWhite
        makeRounded(radius: 8)
        layer.borderWidth = 1
        layer.borderColor = UIColor.naverMapGray2.cgColor
        
        searchRecommendLabel.do {
            $0.textColor = .naverMapBlack
            $0.font = .body5
        }
    }
    
    func setupLayout() {
        addSubviews([searchImageView,
                     searchRecommendLabel])
        
        searchImageView.snp.makeConstraints {
            $0.width.height.equalTo(24)
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(8)
        }
        
        searchRecommendLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(searchImageView.snp.trailing).offset(1)
            $0.trailing.equalToSuperview().inset(8)
        }
    }
}
