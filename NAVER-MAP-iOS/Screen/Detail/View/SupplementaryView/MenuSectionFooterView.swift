//
//  MenuSectionFooterView.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/24/23.
//

import UIKit

class MenuSectionFooterView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let identifier = "MenuSectionFooterView"

    // MARK: - UI Properties
    
    private let horizLine = UIView()
    
    private let moreMenuView = UIView()
    private let moreMenuStackView = UIStackView()
    private let moreMenuLabel = UILabel()
    private let moreMenuIc = UIImageView()
    
    private let bottomDividingBar = UIView()
    
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

private extension MenuSectionFooterView {
    
    func setupStyle() {
        self.backgroundColor = .naverMapWhite
    }
    
    func setupViews() {
        self.addSubviews([horizLine, moreMenuView, bottomDividingBar])
        moreMenuView.addSubview(moreMenuStackView)
        
        moreMenuStackView.addArrangedSubviews(moreMenuLabel, moreMenuIc)
    }
        
    func setupConstraints() {
        horizLine.snp.makeConstraints {
            $0.top.equalToSuperview().inset(33)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(343)
            $0.height.equalTo(1)
        }
        
        moreMenuView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(124)
            $0.height.equalTo(39)
        }
        
        moreMenuStackView.snp.makeConstraints {
            $0.top.equalTo(moreMenuView.snp.top).inset(10)
            $0.leading.equalTo(moreMenuView.snp.leading).inset(18)
        }
        
        bottomDividingBar.snp.makeConstraints {
            $0.top.equalTo(moreMenuView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(10)
        }
    }
    
    func setupProperties() {
        horizLine.do {
            $0.backgroundColor = .naverMapBlueGray2
        }
        
        moreMenuView.do {
            $0.backgroundColor = .naverMapBlueGray2
            $0.layer.cornerRadius = 20
        }
        
        moreMenuStackView.do {
            $0.axis = .horizontal
            $0.spacing = 2
            $0.alignment = .center
        }
        
        moreMenuLabel.do {
            $0.text = "메뉴 더보기"
            $0.font = .body7
            $0.textColor = .naverMapGray6
        }
        
        moreMenuIc.do {
            $0.image = ImageLiterals.ic_arrow_right
        }
        
        bottomDividingBar.do {
            $0.backgroundColor = UIColor.naverMapGray1
        }
    }
}
