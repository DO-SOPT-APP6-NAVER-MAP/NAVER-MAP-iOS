//
//  VisotorSectionHeaderView.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/27/23.
//

import UIKit

class VisitorSectionHeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let identifier = "VisitorSectionHeaderView"
    
    // MARK: - UI Properties
    private let titleLabel = UILabel()
    private let reviewCnt = UILabel()
    
    private let writeIc = UIImageView()
    private let writeLabel = UILabel()
    
    private let reviewImgStackView = UIStackView()
    private let reviewImg1 = UIImageView()
    private let reviewImg2 = UIImageView()
    private let reviewImg3 = UIImageView()
    
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

//MARK: - Private Extension

private extension VisitorSectionHeaderView {
    func setupStyle() {
        self.backgroundColor = .naverMapWhite
    }
    
    func setupViews() {
        self.addSubviews([titleLabel, reviewCnt, writeIc, writeLabel, reviewImgStackView])
        
        reviewImgStackView.addArrangedSubviews(reviewImg1, reviewImg2, reviewImg3)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(26)
            $0.leading.equalToSuperview().inset(15)
            $0.trailing.equalToSuperview().inset(277)
        }
        
        reviewCnt.snp.makeConstraints {
            $0.leading.equalTo(titleLabel.snp.trailing).offset(4)
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().inset(239)
        }
        
        writeIc.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.trailing.equalToSuperview().inset(75)
        }
        
        writeLabel.snp.makeConstraints {
            $0.centerY.equalTo(writeIc)
            $0.leading.equalTo(writeIc.snp.trailing)
        }
        
        reviewImgStackView.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(11)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
        
    func setupProperties() {
        titleLabel.setupLabel(font: .title3, text: "방문자 리뷰", textColor: .naverMapBlack)
        
        reviewCnt.setupLabel(font: .title3, text: String(DetailVisitorReviewData.detailVisitorDummy.count), textColor: .naverMapGray4)
        
        writeIc.do {
            $0.image = ImageLiterals.ic_write
        }
        
        writeLabel.setupLabel(font: .body7, text: "리뷰 쓰기", textColor: .naverMapSubBlue)
        
        reviewImgStackView.setupStackView(bgColor: .naverMapWhite, axis: .vertical, distribution: .equalSpacing)
        
        reviewImgStackView.do {
            $0.spacing = 12
        }
        
        reviewImg1.do {
            $0.image = ImageLiterals.review_bar_1
        }
        
        reviewImg2.do {
            $0.image = ImageLiterals.review_bar_2
        }
        
        reviewImg3.do {
            $0.image = ImageLiterals.review_bar_3
        }
    }
}

