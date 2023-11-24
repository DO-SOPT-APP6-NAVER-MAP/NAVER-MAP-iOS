//
//  MenuSectionHeaderView.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/24/23.
//

import UIKit

class MenuSectionHeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let identifier = "MenuSectionHeaderView"
    
    // MARK: - UI Properties
    
    private let menuHeaderStackView = UIStackView()
    
    private let menuLabel = UILabel()
    
    private let toGoStackView = UIStackView()
    private let toGoIc = UIImageView()
    private let toGoLabel = UILabel()
    
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

private extension MenuSectionHeaderView {
    func setupStyle() {
        self.backgroundColor = .naverMapWhite
    }
    
    func setupViews() {
        self.addSubview(menuHeaderStackView)
        
        menuHeaderStackView.addArrangedSubviews(menuLabel, toGoStackView)
        toGoStackView.addArrangedSubviews(toGoIc, toGoLabel)
    }
    
    func setupConstraints() {
        menuHeaderStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setupProperties() {
        menuHeaderStackView.do {
            $0.axis = .horizontal
            $0.spacing = 273
        }
        
        menuLabel.do {
            $0.text = "메뉴"
            $0.font = .title3
            $0.textColor = .naverMapBlack
        }
        
        toGoStackView.do {
            $0.axis = .horizontal
            $0.spacing = 4
            $0.alignment = .center
        }
        
        toGoIc.do {
            $0.image = ImageLiterals.ic_to_go
        }
        
        toGoLabel.do {
            $0.text = "포장"
            $0.font = .bodyButton
            $0.textColor = .naverMapGray7
        }
    }
}
