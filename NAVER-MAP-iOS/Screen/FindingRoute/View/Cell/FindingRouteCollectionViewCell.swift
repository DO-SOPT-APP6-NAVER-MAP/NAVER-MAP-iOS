//
//  FindingRouteCollectionViewCell.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/28/23.
//

import UIKit

import SnapKit
import Then

final class FindingRouteCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "FindingRouteCollectionViewCell"
    
    private let routeImageView: UIImageView = UIImageView()
    
    private let buttonStackView: UIStackView = UIStackView()
    private let shareBtn: UIButton = UIButton()
    private let pinBtn: UIButton = UIButton()
    
    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FindingRouteCollectionViewCell {
    func configCell(forURL: String) {
        // TODO: - Image 넣기
    }
}

private extension FindingRouteCollectionViewCell {
    func setupStyle() {
        backgroundColor = .naverMapWhite
        layer.borderWidth = 1
        layer.borderColor = UIColor.naverMapBlueGray3.cgColor
        
        buttonStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
        }
        
        shareBtn.do {
            $0.setImage(ImageLiterals.ic_share.withTintColor(.naverMapBlueGray4), for: .normal)
        }
        
        pinBtn.do {
            $0.setImage(ImageLiterals.ic_pin_bg, for: .normal)
        }
    }
    
    func setupLayout() {
        addSubviews([routeImageView,
                     buttonStackView])
        buttonStackView.addArrangedSubviews(shareBtn,
                                            pinBtn)
        
        routeImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview().inset(14)
        }
    }
}
