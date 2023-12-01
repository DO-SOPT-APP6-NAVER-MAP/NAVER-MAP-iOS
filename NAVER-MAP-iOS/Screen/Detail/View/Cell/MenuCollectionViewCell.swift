//
//  MenuCollectionViewCell.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/24/23.
//

import UIKit

import Kingfisher

class MenuCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "MenuCollectionViewCell"
    
    // MARK: - UI Properties
    
    private var menuImage = UIImageView()
    
    private let menuLabelStackView = UIStackView()
    private lazy var menuNameLabel: UILabel = { createLabel(forFont: .body5, forColor: .naverMapGray7)}()
    private lazy var menuPriceLabel: UILabel = { createLabel(forFont: .body3, forColor: .naverMapGray7)}()
    private lazy var menuOrderCntLabel: UILabel = { createLabel(forFont: .body7, forColor: .naverMapGray4)}()

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

private extension MenuCollectionViewCell {
    
    func setupStyle() {
        self.backgroundColor = .naverMapWhite
    }
    
    func setupViews() {
        contentView.addSubviews([menuImage, menuLabelStackView])
        menuLabelStackView.addArrangedSubviews(menuNameLabel, menuPriceLabel, menuOrderCntLabel)
    }
    
    func setupConstraints() {
        menuImage.snp.makeConstraints {
            $0.top.centerX.equalToSuperview()
            $0.size.equalTo(166)
        }
        
        menuLabelStackView.snp.makeConstraints {
            $0.top.equalTo(menuImage.snp.bottom).offset(4)
            $0.leading.equalTo(menuImage)
        }
    }
    
    func setupProperties() {
        menuImage.do {
            $0.makeRounded(radius: 20)
        }
        
        menuLabelStackView.do {
            $0.axis = .vertical
            $0.alignment = .leading
            $0.spacing = 1
        }
    }
    
    // MARK: - Create UI Properties Method
    
    func createLabel(forFont: UIFont, forColor: UIColor) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.font = forFont
        label.textColor = forColor
        return label
    }
}

extension MenuCollectionViewCell {
    
    // MARK: - Bind Data Method
    func bindData(data: MenuInfo) {
        if let url = URL(string: data.menuImgUrl) {         
            self.menuImage.kf.setImage(with: url)
        }
        self.menuNameLabel.text = data.menuName
        self.menuPriceLabel.text = "\(data.menuPrice)원"
        self.menuOrderCntLabel.text = "주문수 1" 
    }
}
