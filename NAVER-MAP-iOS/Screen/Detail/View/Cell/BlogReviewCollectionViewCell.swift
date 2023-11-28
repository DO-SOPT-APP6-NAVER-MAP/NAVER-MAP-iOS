//
//  BlogReviewCollectionViewCell.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/27/23.
//

import UIKit

final class BlogReviewCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "BlogReviewCollectionViewCell"
    
    // MARK: - UI Properties
    
    private let userStackView = UIStackView()
    private let profileImg = UIImageView()
    private let profileView = UIView()
    private let userName = UILabel()
    private let userDescription = UILabel()
    private let createdDate = UILabel()
    
    private let reviewTitleLabel = UILabel()
    private let reviewContentLabel = UILabel()
    private let reviewImg = UIImageView()
    private let reviewImgCntView = UIView()
    private let reviewImgCntLabel = UILabel()
    
    private let horizLine = UIView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupViews()
        setupConstraints()
        setupProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Method

private extension BlogReviewCollectionViewCell {
    
    func setupStyle() {
        self.backgroundColor = .naverMapWhite
    }
    
    func setupViews() {
        contentView.addSubviews([userStackView, createdDate, reviewTitleLabel, reviewContentLabel, reviewImg, reviewImgCntLabel, horizLine])
        userStackView.addArrangedSubviews(profileImg, userName, userDescription)
        reviewImg.addSubview(reviewImgCntView)
        reviewImgCntView.addSubview(reviewImgCntLabel)
    }
    
    func setupConstraints() {
        profileImg.snp.makeConstraints {
            $0.size.equalTo(28)
        }
        
        userStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.equalToSuperview().inset(1)
        }
        
        createdDate.snp.makeConstraints {
            $0.centerY.equalTo(userStackView)
            $0.leading.equalTo(userStackView.snp.trailing).offset(9)
        }
        
        reviewTitleLabel.snp.makeConstraints {
            $0.top.equalTo(userStackView.snp.bottom).offset(14)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(100)
        }
        
        reviewContentLabel.snp.makeConstraints {
            $0.top.equalTo(reviewTitleLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview().inset(100)
        }
        
        reviewImg.snp.makeConstraints {
            $0.size.equalTo(88)
            $0.top.equalTo(userStackView.snp.bottom).offset(10)
            $0.trailing.equalToSuperview()
        }
        
        reviewImgCntView.snp.makeConstraints {
            $0.size.equalTo(20)
            $0.top.equalToSuperview().inset(58)
            $0.trailing.equalToSuperview().inset(6)
        }
        
        reviewImgCntLabel.snp.makeConstraints { // superview
            $0.center.equalTo(reviewImgCntView)
        }
        
        horizLine.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    func setupProperties() {
        profileImg.do {
            $0.image = ImageLiterals.ic_alarm
        }
        
        userStackView.setupStackView(bgColor: .naverMapWhite, axis: .horizontal, distribution: .equalSpacing, spacing: 8)
        userName.setupLabel(font: .body9, textColor: .naverMapGray6)
        userDescription.setupLabel(font: .body12, textColor: .naverMapGray4)
        createdDate.setupLabel(font: .body12, textColor: .naverMapGray4)

        reviewTitleLabel.setupLabel(font: .body2, textColor: .naverMapSubBlue)
        reviewContentLabel.setupLabel(font: .body6, textColor: .naverMapGray6)
        reviewImgCntLabel.setupLabel(font: .button1, textColor: .naverMapWhite)
        
        reviewTitleLabel.do {
            $0.numberOfLines = 2
        }
        
        reviewContentLabel.do {
            $0.numberOfLines = 2
        }
        
        reviewImg.do {
            $0.makeRounded(radius: 20)
        }
        
        reviewImgCntView.do {
            $0.backgroundColor = .naverMapBlack80
            $0.makeRounded(radius: 10)
        }
        
        horizLine.do {
            $0.backgroundColor = .naverMapBlueGray1
        }
    }
}

extension BlogReviewCollectionViewCell {
    
    // MARK: - Bind Data Method
    
    func bindData(data: DetailBlogData) {
        self.profileImg.image = data.profileImg
        self.userName.text = data.userName
        self.userDescription.text = data.userDescription
        self.createdDate.text = data.createdAt
        self.reviewTitleLabel.text = data.reviewTitle
        self.reviewContentLabel.text = data.reviewContent
        self.reviewImg.image = data.reviewImg
        self.reviewImgCntLabel.text = data.imgCnt
    }
}
