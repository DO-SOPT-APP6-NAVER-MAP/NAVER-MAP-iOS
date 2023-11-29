//
//  LinksSectionHeaderView.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/28/23.
//

import UIKit

protocol LinksSectionHeaderViewDelegate: AnyObject {
    func scrollToTop()
}

class LinksSectionHeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let identifier = "LinksSectionHeaderView"
    weak var delegate: LinksSectionHeaderViewDelegate?
    
    // MARK: - UI Properties
    
    private let titleLabel = UILabel()
    private let linkCnt = UILabel()
    
    private let linkIc = UIImageView()
    private let linkDescription = UILabel()
    
    private let scrollToTopBtn = UIButton()
    
    private let footerView = UIView()
    private let footerStackView = UIStackView()
    private let footerLabel1 = UILabel()
    private let footerLabel2 = UILabel()
    private let footerLabel3 = UILabel()
    private let footerLabel4 = UILabel()
    
    private let naverLogo = UIImageView()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupViews()
        setupConstraints()
        setupProperties()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func scrollToTopBtnTapped() {
        delegate?.scrollToTop()
    }
}

//MARK: - Private Extension

private extension LinksSectionHeaderView {
    func setupStyle() {
        self.backgroundColor = .naverMapWhite
    }
    
    func setupViews() {
        self.addSubviews([titleLabel, linkCnt, linkIc, linkDescription, scrollToTopBtn, footerView])
        footerView.addSubviews([footerStackView, naverLogo])
        footerStackView.addArrangedSubviews(footerLabel1, footerLabel2, footerLabel3, footerLabel4)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(18)
        }
        
        linkCnt.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(4)
        }
        
        linkIc.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(20)
            $0.leading.equalTo(titleLabel)
            $0.size.equalTo(30)
        }
        
        linkDescription.snp.makeConstraints {
            $0.centerY.equalTo(linkIc)
            $0.leading.equalTo(linkIc.snp.trailing).offset(8)
        }
        
        scrollToTopBtn.snp.makeConstraints {
            $0.size.equalTo(41)
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(116)
            $0.bottom.equalToSuperview().inset(16)
        }
        
        footerView.snp.makeConstraints {
            $0.width.equalTo(getDeviceWidth())
            $0.height.equalTo(108)
            $0.top.equalToSuperview().inset(173)
            $0.centerX.equalToSuperview()
        }
        
        footerStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32)
            $0.centerX.equalToSuperview()
        }
        
        naverLogo.snp.makeConstraints {
            $0.top.equalTo(footerStackView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(32)
        }
    }
    
    func setupProperties() {
        titleLabel.setupLabel(font: .title3, text: "관련 링크", textColor: .naverMapBlack)
        linkCnt.setupLabel(font: .title3, text: "2", textColor: .naverMapGray4) // 현 API상으론 없음
        linkIc.setupImageView(image: ImageLiterals.img_dining_code, borderColor: .clear, width: 30)
        linkDescription.setupLabel(font: .body5, text: "다이닝코드에서 보기", textColor: .naverMapSubBlue)
        
        scrollToTopBtn.do {
            $0.setImage(ImageLiterals.ic_arrow_up, for: .normal)
            $0.backgroundColor = .naverMapWhite
            $0.layer.borderColor = UIColor.naverMapGray2.cgColor
            $0.layer.borderWidth = 1
            $0.layer.cornerRadius = 20
            $0.layer.shadowColor = UIColor.naverMapBlack10.cgColor
            $0.layer.shadowOpacity = 1
            $0.layer.shadowRadius = 4
            $0.layer.shadowOffset = CGSize(width: 0, height: 3)
            $0.isUserInteractionEnabled = true
        }
        
        footerView.do {
            $0.backgroundColor = .naverMapGray1
        }
        
        footerStackView.setupStackView(bgColor: .clear, axis: .horizontal, distribution: .equalSpacing, spacing: 20)
        footerLabel1.setupLabel(font: .body10, text: "이용약관" ,textColor: .naverMapGray4)
        footerLabel2.setupLabel(font: .body10, text: "고객센터" ,textColor: .naverMapGray4)
        footerLabel3.setupLabel(font: .body10, text: "리뷰운영정책" ,textColor: .naverMapGray4)
        footerLabel4.setupLabel(font: .body10, text: "신고센터" ,textColor: .naverMapGray4)
        
        naverLogo.setupImageView(image: UIImage.load(name: "Naver_Logotype_1"), borderColor: .clear, width: 52)
    }
    
    func setAddTarget() {
        scrollToTopBtn.addTarget(self, action: #selector(scrollToTopBtnTapped), for: .touchUpInside)
    }
}
