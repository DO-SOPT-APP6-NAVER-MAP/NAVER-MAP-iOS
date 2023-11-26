//
//  MainSearchRootView.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/25/23.
//

import UIKit

import SnapKit
import Then

final class MainSearchRootView: UIView {
    
    // MARK: - UI Properties

    private let searchTopView: UIView = UIView()
    private let searchTopStackView: UIStackView = UIStackView()
    private let searchTopBackBtn: UIButton = UIButton()
    private let searchTopTextField: UITextField = UITextField()
    private let searchTopCancleBtn: UIButton = UIButton()
    
    private let emptyResultView: UIView = EmptySearchView()
    
    // MARK: - View Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Extension

private extension MainSearchRootView {
    
    func setupStyle() {
        
        backgroundColor = .naverMapWhite
        
        searchTopView.do {
            $0.backgroundColor = .naverMapWhite
            $0.layer.shadowOffset = CGSize(width: 0, height: 0.5)
            $0.layer.shadowOpacity = 0.6
            $0.layer.shadowRadius = 1
            $0.layer.shadowColor = UIColor.naverMapGray4.cgColor
        }
        
        searchTopStackView.do {
            $0.axis = .horizontal
            $0.spacing = 8
            $0.alignment = .center
        }
        
        searchTopBackBtn.do {
            $0.setImage(ImageLiterals.ic_arrow_left_and, for: .normal)
        }
        
        searchTopTextField.do {
            $0.makeRounded(radius: 10)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.naverMapGray2.cgColor
            $0.addPadding(left: 12, right: 12)
        }
        
        searchTopCancleBtn.do {
            $0.setImage(ImageLiterals.ic_remove, for: .normal)
        }
    }
    
    func setupLayout() {
        addSubviews([emptyResultView,
                     searchTopView])
        searchTopView.addSubview(searchTopStackView)
        searchTopStackView.addArrangedSubviews(searchTopBackBtn,
                                               searchTopTextField,
                                               searchTopCancleBtn)

        searchTopView.snp.makeConstraints {
            $0.height.equalTo(58)
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.equalToSuperview()
        }
        
        emptyResultView.snp.makeConstraints {
            $0.edges.bottom.equalToSuperview()
        }
                
        searchTopStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        searchTopTextField.snp.makeConstraints {
            $0.height.equalTo(40)
            $0.width.equalTo(convertByWidthRatio(278))
        }
    }
}
