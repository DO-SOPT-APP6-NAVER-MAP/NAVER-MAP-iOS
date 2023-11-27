//
//  MenuSectionFooterView.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/24/23.
//

import UIKit

class SectionFooterView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let identifier = "MenuSectionFooterView"

    // MARK: - UI Properties
    
    private let horizLine = UIView()
    
    private let moreInfoView = UIView()
    private let moreInfoStackView = UIStackView()
    private let moreInfoLabel = UILabel()
    private let moreInfoIc = UIImageView()
    
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
    
    func setLabelText(LabelText: String){
        self.moreInfoLabel.text = LabelText
        moreInfoView.snp.makeConstraints {
            $0.width.equalTo(moreInfoStackView.snp.width).offset(34)
        }
    }
}

// MARK: - Private Method

private extension SectionFooterView {
    
    func setupStyle() {
        self.backgroundColor = .naverMapWhite
    }
    
    func setupViews() {
        self.addSubviews([horizLine, moreInfoView, bottomDividingBar])
        moreInfoView.addSubview(moreInfoStackView)
        
        moreInfoStackView.addArrangedSubviews(moreInfoLabel, moreInfoIc)
    }
        
    func setupConstraints() {
        horizLine.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(17)
            $0.height.equalTo(1)
        }
        
        moreInfoView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(horizLine)
            $0.height.equalTo(39)
        }
        
        moreInfoStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        bottomDividingBar.snp.makeConstraints {
            $0.top.equalTo(moreInfoView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(10)
        }
    }
    
    func setupProperties() {
        horizLine.do {
            $0.backgroundColor = .naverMapBlueGray2
        }
        
        moreInfoView.do {
            $0.backgroundColor = .naverMapBlueGray2
            $0.layer.cornerRadius = 20
        }
        
        moreInfoStackView.do {
            $0.axis = .horizontal
            $0.spacing = 2
            $0.alignment = .center
        }
        
        moreInfoLabel.do {
            $0.font = .body7
            $0.textColor = .naverMapGray6
        }
        
        moreInfoIc.do {
            $0.image = ImageLiterals.ic_arrow_right
        }
        
        bottomDividingBar.do {
            $0.backgroundColor = .naverMapGray1
        }
    }
}
