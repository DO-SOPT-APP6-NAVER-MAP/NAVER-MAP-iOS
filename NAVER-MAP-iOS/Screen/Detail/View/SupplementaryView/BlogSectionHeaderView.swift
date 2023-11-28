//
//  BlogSectionHeaderView.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/28/23.
//

import UIKit

class BlogSectionHeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let identifier = "BlogSectionHeaderView"
    private var blogReviewDummy = DetailBlogData.detailBlogData

    // MARK: - UI Properties
    
    private let titleLabel = UILabel()
    private let reviewCnt = UILabel()
    
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

private extension BlogSectionHeaderView {
    func setupStyle() {
        self.backgroundColor = .naverMapWhite
    }
    
    func setupViews() {
        self.addSubviews([titleLabel, reviewCnt])
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(18)
        }
        
        reviewCnt.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(4)
        }
    }
    
    func setupProperties() {
        titleLabel.setupLabel(font: .title3, text: "블로그 리뷰", textColor: .naverMapBlack)
        reviewCnt.setupLabel(font: .title3, text: String(blogReviewDummy.count), textColor: .naverMapGray4)
    }
}
