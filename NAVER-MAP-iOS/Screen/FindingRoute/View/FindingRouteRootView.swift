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
    
    
    private let searchResultHeaderView: UIImageView = UIImageView(image: ImageLiterals.tap_choice_transport_ios)
    
    private let searchResultTimeView: UIView = UIView()
    private let searchResultStartTimeLabel: UILabel = UILabel()
    private let searchResultStartTimeLabelBtn: UIButton = UIButton()
    private let searchResultFilterLabel: UILabel = UILabel()
    private let searchResultFilterLabelBtn: UIButton = UIButton()
    
    private let findRouteCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

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
                $0.font = .body2
                $0.textColor = .naverMapBlack
                $0.backgroundColor = .naverMapGray1
                $0.addPadding(left: 16)
                $0.makeRounded(radius: 2)
            }
        }
        
        searchTopStartTextField.do {
            $0.text = "서울 광진구 능동로 120"
        }
        
        searchTopStartCancleBtn.do {
            $0.setImage(ImageLiterals.ic_remove, for: .normal)
        }
        
        searchTopArriveStarBtn.do {
            $0.setImage(ImageLiterals.ic_star, for: .normal)
        }
        
        searchResultStartTimeLabel.do {
            $0.text = "오늘 오후 12:17 출발"
            $0.font = .bodyButton
            $0.textColor = .naverMapBlue
            $0.highlightText(forText: "출발", forColor: .naverMapBlack)
        }
        
        searchResultStartTimeLabelBtn.do {
            $0.setImage(ImageLiterals.ic_dropdown_circle, for: .normal)
        }
        
        searchResultFilterLabel.do {
            $0.text = "최적 경로순"
            $0.font = .body12
            $0.textColor = .naverMapBlack
        }
        
        searchResultFilterLabelBtn.do {
            $0.setImage(ImageLiterals.ic_dropdown_circle, for: .normal)
        }
        
        findRouteCollectionView.do {
            $0.backgroundColor = .naverMapBlueGray2
            $0.register(FindingRouteCollectionViewCell.self, forCellWithReuseIdentifier: FindingRouteCollectionViewCell.identifier)
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false
        }
    }
    
    func setupLayout() {
        addSubviews([searchTopView,
                     searchResultHeaderView,
                     searchResultTimeView,
                     findRouteCollectionView])
        
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
        
        searchResultTimeView.addSubviews([searchResultStartTimeLabel,
                                          searchResultStartTimeLabelBtn,
                                          searchResultFilterLabel,
                                          searchResultFilterLabelBtn])
        
        searchTopView.snp.makeConstraints {
            $0.height.equalTo(152)
            $0.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
        
        searchResultHeaderView.snp.makeConstraints {
            $0.top.equalTo(searchTopView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        
        searchResultTimeView.snp.makeConstraints {
            $0.height.equalTo(45)
            $0.top.equalTo(searchResultHeaderView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
        }
        
        findRouteCollectionView.snp.makeConstraints {
            $0.top.equalTo(searchResultTimeView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalTo(safeAreaLayoutGuide).inset(23)
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
        
        searchResultStartTimeLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
        }
        
        searchResultStartTimeLabelBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(searchResultStartTimeLabel.snp.trailing).offset(5)
        }
        
        searchResultFilterLabelBtn.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
        
        searchResultFilterLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalTo(searchResultFilterLabelBtn.snp.leading).offset(-5)
        }
    }
}
