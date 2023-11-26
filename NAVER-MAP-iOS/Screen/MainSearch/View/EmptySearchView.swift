//
//  EmptySearchView.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/25/23.
//

import UIKit

import SnapKit
import Then

final class EmptySearchView: UIView {
    
    private let mainStackView: UIStackView = UIStackView()
    private let searchImageView: UIImageView = UIImageView(image: ImageLiterals.img_search_big)
    private let emptyLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmptySearchView {
    func setupLabel(forEmpty: Bool) {
        if forEmpty {
            emptyLabel.text = "검색어를 입력해주세요."
        } else {
            emptyLabel.text = "일치하는 검색어가 없습니다."
        }
    }
}

private extension EmptySearchView {
    
    func setupStyle() {
        backgroundColor = .naverMapWhite
        
        mainStackView.do {
            $0.axis = .vertical
            $0.spacing = 20
            $0.alignment = .center
        }
        
        emptyLabel.do {
            $0.text = "검색어를 입력해주세요."
            $0.font = .title2
            $0.textColor = .naverMapGray4
            $0.textAlignment = .center
        }
    }
    
    func setupLayout() {
        addSubview(mainStackView)
        
        mainStackView.addArrangedSubviews(searchImageView,
                                          emptyLabel)
        
        mainStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
