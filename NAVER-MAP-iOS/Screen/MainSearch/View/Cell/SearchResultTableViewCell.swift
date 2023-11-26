//
//  SearchResultTableViewCell.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/26/23.
//

import UIKit

final class SearchResultTableViewCell: UITableViewCell {

    static let identifier = "SearchResultTableViewCell"
    
    private let locationImageView: UIImageView = UIImageView(image: ImageLiterals.ic_location_ios)

    private let mainInfoStackView: UIStackView = UIStackView()
    private let mainLocationNameLabel: UILabel = UILabel()
    private let mainLocationLabel: UILabel = UILabel()
    private let mainReviewCountLabel: UILabel = UILabel()
    
    private let subInfoStackView: UIStackView = UIStackView()
    private let subCategoryLabel: UILabel = UILabel()
    private let subDistanceLabel: UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SearchResultTableViewCell {
    
    func setupStyle() {
        backgroundColor = .naverMapWhite
        
        mainInfoStackView.do {
            $0.axis = .vertical
            $0.spacing = 4
            $0.alignment = .leading
        }
        
        subInfoStackView.do {
            $0.axis = .vertical
            $0.spacing = 10
            $0.alignment = .trailing
        }
        
        mainLocationNameLabel.do {
            $0.font = .title4
            $0.textColor = .naverMapBlack
        }
        
        mainLocationLabel.do {
            $0.font = .body7
            $0.textColor = .naverMapGray4
        }
        
        mainReviewCountLabel.do {
            $0.font = .body10
            $0.textColor = .naverMapGray4
        }
        
        subCategoryLabel.do {
            $0.font = .body10
            $0.textColor = .naverMapGray7
        }
        
        subDistanceLabel.do {
            $0.font = .body10
            $0.textColor = .naverMapGray7
        }
    }
    
    func setupLayout() {
        addSubviews([locationImageView,
                     mainInfoStackView,
                     subInfoStackView])
        
        mainInfoStackView.addArrangedSubviews(mainLocationNameLabel,
                                              mainLocationLabel,
                                              mainReviewCountLabel)
        subInfoStackView.addArrangedSubviews(subCategoryLabel,
                                             subDistanceLabel)
        
        locationImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(15)
            $0.leading.equalToSuperview().inset(18)
        }
        
        mainInfoStackView.snp.makeConstraints {
            $0.top.equalTo(locationImageView.snp.top)
            $0.leading.equalTo(locationImageView.snp.trailing).offset(12)
            $0.trailing.equalTo(subInfoStackView.snp.leading).offset(-3)
        }
        
        subInfoStackView.snp.makeConstraints {
            $0.top.equalTo(mainInfoStackView.snp.top)
            $0.trailing.equalToSuperview().inset(18)
        }
    }
}
