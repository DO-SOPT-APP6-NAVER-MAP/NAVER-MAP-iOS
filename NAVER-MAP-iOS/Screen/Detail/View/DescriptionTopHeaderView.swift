//
//  DescriptioinTopHeaderView.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/30/23.
//

import UIKit

import SnapKit
import Then

class DescriptionTopHeaderView: UIView {
    
    // MARK: - UI Properteis
    private let headerHorizStackView = UIStackView()
    
    private let homeStackView = UIStackView()
    private let homeLabel = UILabel()
    private lazy var homeIndicator: UIView = { createIndicator(forColor: .naverMapBlack) }()

    
    private let menuStackView = UIStackView()
    private let menuLabel = UILabel()
    private lazy var menuIndicator: UIView = { createIndicator(forColor: .clear) }()

    private let reviewStackView = UIStackView()
    private let reviewLabel = UILabel()
    private lazy var reviewIndicator: UIView = { createIndicator(forColor: .clear) }()

    private let horizDividingLine = UIView()

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

private extension DescriptionTopHeaderView {
    func setupStyle() {
        self.backgroundColor = .naverMapWhite
        self.isHidden = true
    }
    
    func setupViews() {
        self.addSubviews([headerHorizStackView, horizDividingLine])
        
        /// headerHorizStackView
        headerHorizStackView.addArrangedSubviews(homeStackView, menuStackView, reviewStackView)
        homeStackView.addArrangedSubviews(homeLabel, homeIndicator)
        menuStackView.addArrangedSubviews(menuLabel, menuIndicator)
        reviewStackView.addArrangedSubviews(reviewLabel, reviewIndicator)
    }
    
    func setupConstraints() {
        self.snp.makeConstraints {
            $0.width.equalTo(getDeviceWidth())
            $0.height.equalTo(45)
        }
        
        headerHorizStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalTo(homeStackView.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        horizDividingLine.snp.makeConstraints {
            $0.top.equalTo(homeIndicator.snp.bottom)
            $0.width.equalTo(getDeviceWidth())
            $0.height.equalTo(1)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setupProperties() {
        headerHorizStackView.setupStackView(bgColor: .naverMapWhite, axis: .horizontal, distribution: .equalSpacing, spacing: 15)
        [homeStackView, menuStackView, reviewStackView].forEach {
            $0.setupStackView(bgColor: .naverMapWhite, axis: .vertical, distribution: .equalSpacing, spacing: 14)
        }
        
        homeLabel.setupLabel(font: .body1, text: "홈", textColor: .naverMapBlack)
        menuLabel.setupLabel(font: .body1, text: "메뉴", textColor: .naverMapBlack)
        reviewLabel.setupLabel(font: .body1, text: "리뷰", textColor: .naverMapBlack)
        
        horizDividingLine.snp.makeConstraints {
            $0.top.equalTo(homeIndicator.snp.bottom)
            $0.width.equalTo(getDeviceWidth())
            $0.height.equalTo(1)
            $0.centerX.equalToSuperview()
        }
    }
    
    // MARK: - Create UI Method
    
    func createIndicator(forColor: UIColor) -> UIView {
        let indicator = UIView()
        indicator.backgroundColor = forColor
        indicator.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(1)
        }
        return indicator
    }
}

