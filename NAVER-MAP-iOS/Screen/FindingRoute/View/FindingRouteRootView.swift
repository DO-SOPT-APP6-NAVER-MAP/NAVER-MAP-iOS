//
//  FindingRouteRootView.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/28/23.
//

import UIKit

import SnapKit
import Then

final class FindingRouteRootView: UIView {

    // MARK: - UI Properties
    
    private let searchTopView: UIView = UIView()
    private let searchTopHorizontalStackView: UIStackView = UIStackView()
    
    private let searchTopChangeImageView: UIImageView = UIImageView(image: ImageLiterals.ic_change)
    private let searchTopStartArriveStackView: UIStackView = UIStackView()
    
    private let searchTopStartStackView: UIStackView = UIStackView()
    private let searchTopStartTextField: UITextField = UITextField()
    private let searchTopStartCancleBtn: UIButton = UIButton()
    
    private let searchTopArriveStackView: UIStackView = UIStackView()
    private let searchTopArriveTextField: UITextField = UITextField()
    private let searchTopArriveStarBtn: UIButton = UIButton()
    
    private let transportStackView: UIStackView = UIStackView()
    private let transportBusImageView: UIImageView = UIImageView(image: ImageLiterals.ic_bus_white)
    private let transportCarImageView: UIImageView = UIImageView(image: ImageLiterals.ic_car)
    private let transportWalkImageView: UIImageView = UIImageView(image: ImageLiterals.ic_walk)
    private let transportBikeImageView: UIImageView = UIImageView(image: ImageLiterals.ic_riding)
    
    private let transportBusSelectedImageView: UIImageView = UIImageView(image: ImageLiterals.bus_info_btn)

        
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

private extension FindingRouteRootView {
    func setupStyle() {
        backgroundColor = .naverMapWhite
        
        searchTopHorizontalStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
            $0.alignment = .center
        }
        
        searchTopStartArriveStackView.do {
            $0.axis = .vertical
            $0.spacing = 7
            $0.distribution = .fill
        }
        
        transportStackView.do {
            $0.axis = .horizontal
            $0.spacing = 60
            $0.alignment = .center
        }
        
        [searchTopStartStackView, searchTopArriveStackView].forEach {
            $0.do {
                $0.axis = .horizontal
                $0.spacing = 10
                $0.alignment = .center
            }
        }
        
        [searchTopStartTextField, searchTopArriveTextField].forEach {
            $0.do {
                $0.backgroundColor = .naverMapGray1
                $0.makeRounded(radius: 2)
            }
        }
        
        searchTopStartCancleBtn.do {
            $0.setImage(ImageLiterals.ic_remove, for: .normal)
        }
        
        searchTopArriveStarBtn.do {
            $0.setImage(ImageLiterals.ic_star, for: .normal)
        }
    }
    
    func setupLayout() {
        addSubview(searchTopView)
        searchTopView.addSubviews([searchTopHorizontalStackView,
                                   transportStackView])
        searchTopHorizontalStackView.addArrangedSubviews(searchTopChangeImageView,
                                                         searchTopStartArriveStackView)
        
        searchTopStartArriveStackView.addArrangedSubviews(searchTopStartStackView,
                                                          searchTopArriveStackView)
        
        searchTopStartStackView.addArrangedSubviews(searchTopStartTextField,
                                                    searchTopStartCancleBtn)
        searchTopArriveStackView.addArrangedSubviews(searchTopArriveTextField,
                                                     searchTopArriveStarBtn)
        
        transportStackView.addArrangedSubviews(transportBusImageView,
                                               transportCarImageView,
                                               transportWalkImageView,
                                               transportBikeImageView)
        transportStackView.addSubview(transportBusSelectedImageView)
        
        searchTopView.snp.makeConstraints {
            $0.height.equalTo(152)
            $0.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
        
        transportStackView.snp.makeConstraints {
            $0.top.equalTo(searchTopHorizontalStackView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        [searchTopChangeImageView, 
         searchTopStartCancleBtn,
         searchTopArriveStarBtn].forEach {
            $0.snp.makeConstraints {
                $0.width.height.equalTo(24)
            }
        }
        
        searchTopHorizontalStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.horizontalEdges.equalToSuperview().inset(14)
        }
        
        searchTopStartTextField.snp.makeConstraints {
            $0.height.equalTo(38)
        }
        
        searchTopArriveTextField.snp.makeConstraints {
            $0.height.equalTo(38)
        }
        
        transportBusSelectedImageView.snp.makeConstraints {
            $0.centerY.equalTo(transportBusImageView)
            $0.leading.equalTo(searchTopChangeImageView)
        }
    }
}
