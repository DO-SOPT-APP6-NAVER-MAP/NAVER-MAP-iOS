//
//  DetailTopHeaderView.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/29/23.
//

import UIKit

import SnapKit
import Then

class DetailTopHeaderView: UIView {
    
    // MARK: - UIProperties
    
    private let paginatorBtn = UIButton()
    private let locationName = UILabel()
    private let exitBtn = UIButton()
    
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

private extension DetailTopHeaderView {
    
    func setupStyle() {
        self.backgroundColor = .naverMapWhite
    }
    
    func setupViews() {
        self.addSubviews([paginatorBtn, locationName, exitBtn])
    }
    
    func setupConstraints() {
        self.snp.makeConstraints {
            $0.width.equalTo(getDeviceWidth())
            $0.height.equalTo(48)
        }
        
        paginatorBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.size.equalTo(24)
        }
        
        locationName.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(paginatorBtn.snp.trailing).offset(6)
        }
        
        exitBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(24) 
        }
    }
    
    func setupProperties() {
        
        self.do {
            $0.isHidden = true
        }
        
        paginatorBtn.do {
            $0.setImage(ImageLiterals.ic_arrow_left_g6, for: .normal)
        }
        
        exitBtn.do {
            $0.setImage(ImageLiterals.ic_multiply, for: .normal)
        }
        
        locationName.setupLabel(font: .title2, text: "알고", textColor: .naverMapBlack)
    }
}
