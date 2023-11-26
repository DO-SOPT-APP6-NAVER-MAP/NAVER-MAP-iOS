//
//  VisitorReviewCollectionViewCell.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/25/23.
//

import UIKit

class VisitorReviewCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "VisitorReviewCollectionViewCell"
    
    // MARK: - UI Properties
    private lazy var reviewStackView: UIStackView = { createStackView(forAxis: .vertical, 
                                                                      forSpacig: 21,
                                                                      forAlignment: .leading)}()
    private lazy var reviewLabel: UILabel = { createLabel(forFont: .body7, 
                                                          forColor: .naverMapGray6)}()
    
    private lazy var userStackView: UIStackView = { createStackView(forAxis: .horizontal, 
                                                                    forSpacig: 10,
                                                                    forAlignment: .center)}()
    private lazy var userLabelStackView: UIStackView = { createStackView(forAxis: .vertical,
                                                                         forSpacig: 0,
                                                                         forAlignment: .leading)}()
    private let userImgView = UIView()
    private let userImg = UIImageView()
    private lazy var userName: UILabel = { createLabel(forFont: .body9,
                                                       forColor: .naverMapGray6)}()
    
    private lazy var visitStackView: UIStackView = { createStackView(forAxis: .horizontal, 
                                                                     forSpacig: 9,
                                                                     forAlignment: .center)}()
    private lazy var visitDate: UILabel = { createLabel(forFont: .body12, 
                                                        forColor: .naverMapGray4)}()
    private lazy var visitCnt: UILabel = { createLabel(forFont: .body9, 
                                                       forColor: .naverMapGray6)}()
    private lazy var visitorReviewType: UILabel = { createLabel(forFont: .body9, 
                                                                forColor: .naverMapGray6)}()

    private let reviewImg = UIImageView()
    private lazy var reviewImgCnt: UILabel = { createLabel(forFont: .button1, 
                                                           forColor: .naverMapWhite)}() // 해당 폰트 피그마에 없음
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

private extension VisitorReviewCollectionViewCell {
    
    func setupStyle() {
        self.backgroundColor = .naverMapWhite
    }
    
    func setupViews() {
        contentView.addSubviews([reviewStackView, reviewImg, reviewImgCnt, horizLine])
        userImgView.addSubview(userImg)
        
        reviewStackView.addArrangedSubviews(reviewLabel, userStackView)
        userStackView.addArrangedSubviews(userImgView, userLabelStackView)
        userLabelStackView.addArrangedSubviews(userName, visitStackView)
        visitStackView.addArrangedSubviews(visitDate, visitCnt, visitorReviewType)
    }
    
    func setupConstraints() {
        reviewStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(16)
            $0.leading.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(112)
        }
        
        reviewImg.snp.makeConstraints {
            $0.top.equalTo(reviewStackView)
            $0.trailing.equalToSuperview()
            $0.height.width.equalTo(88)
        }
                
        reviewImgCnt.snp.makeConstraints {
            $0.top.equalTo(reviewImg.snp.top).offset(58)
            $0.trailing.equalTo(reviewImg.snp.trailing).inset(7)
            $0.bottom.equalTo(reviewImg.snp.bottom).inset(8)
        }
        
        userImg.snp.makeConstraints {
            $0.centerX.equalTo(userImgView)
            $0.centerY.equalTo(userImgView)
            $0.width.height.equalTo(28)
        }
        
        userImgView.snp.makeConstraints {
            $0.width.height.equalTo(32)
        }
        
        horizLine.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    func setupProperties() {
        
        userImg.do {
            $0.makeRounded(radius: 14)
        }
        
        userImgView.do {
            $0.makeRounded(radius: 16)
            $0.backgroundColor = .naverMapWhite
            $0.layer.shadowColor = UIColor.naverMapBlack.cgColor
            $0.layer.shadowOpacity = 1
            $0.layer.shadowRadius = 1
            $0.layer.shadowOffset = CGSize(width: 0, height: 1)
        }
        
        reviewImg.do {
            $0.makeRounded(radius: 20)
        }
        
        reviewImgCnt.do {
            $0.makeRounded(radius: 8)
            $0.layer.backgroundColor = UIColor.naverMapBlack.cgColor
            $0.textColor = .naverMapWhite
        }
        
        reviewLabel.do {
            $0.numberOfLines = 0
        }
        
        horizLine.do {
            $0.backgroundColor = .naverMapBlueGray1
        }
    }
    
    // MARK: - Create UI Properties Method
    func createStackView(forAxis: NSLayoutConstraint.Axis, forSpacig: CGFloat, forAlignment: UIStackView.Alignment ) -> UIStackView {
        let stack = UIStackView()
        stack.axis = forAxis
        stack.spacing = forSpacig
        stack.alignment = forAlignment
        stack.distribution = .equalSpacing
        return stack
    }
    
    func createLabel(forFont: UIFont, forColor: UIColor) -> UILabel {
        let label = UILabel()
        label.textAlignment = .left
        label.font = forFont
        label.textColor = forColor
        return label
    }
}

extension VisitorReviewCollectionViewCell {
    
    // MARK: - Bind Data Method
    func bindData(data: DetailVisitorReviewData) {
        self.reviewImg.image = data.reviewImg
        self.userImg.image = data.userImg
        self.reviewLabel.text = data.reviewContent
        self.reviewImgCnt.text = data.reviewImgCnt
        self.userName.text = data.userName
        self.visitDate.text = data.visitDate
        self.visitCnt.text = data.visitCnt + "번째 방문"
        self.visitorReviewType.text = data.visitorReviewType
    }
}
