//
//  DescriptionSectionHeaderView.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/23/23.
//

import UIKit

class DescriptionSectionHeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let identifier = "DescriptionSectionHeaderView"

    // MARK: - UI Properties
    
    /// 상단 헤더 뷰
    private lazy var headerHorizStackView: UIStackView = { createHorizStackView(forSpacing: 15) }()
    private let horizDividingLine1 = UIView()
    
    /// 홈 스택뷰
    private lazy var homeStackView: UIStackView = { createVerticStackView(forSpacing: 14) }()
    private lazy var homeLabel: UILabel = { createLabel(forFont: .body1,
                                                        forColor: .naverMapBlack,
                                                        text: "홈")}()
    private lazy var homeIndicator: UIView = { createIndicator(forColor: .naverMapBlack) }()
    
    /// 메뉴 스택뷰
    private lazy var menuStackView: UIStackView = { createVerticStackView(forSpacing: 14) }()
    private lazy var menuLabel: UILabel = { createLabel(forFont: .body1,
                                                        forColor: .naverMapGray4,
                                                        text: "메뉴")}()
    private lazy var menuIndicator: UIView = { createIndicator(forColor: .clear) }()
    
    /// 리뷰 스택뷰
    private lazy var reviewStackView: UIStackView = { createVerticStackView(forSpacing: 14) }()
    private lazy var reviewLabel: UILabel = { createLabel(forFont: .body1,
                                                          forColor: .naverMapGray4,
                                                          text: "리뷰")}()
    private lazy var reviewIndicator: UIView = { createIndicator(forColor: .clear) }()
    
    /// 알람받기
    private lazy var alarmHorizStackView: UIStackView = { createHorizStackView(forSpacing: 2)}()
    private lazy var alarmBoldDescriptLabel: UILabel = { createLabel(forFont: .body6,
                                                                     forColor: .naverMapBlack,
                                                                     text: "이벤트, 혜택")}()
    private lazy var alarmPlainDescriptLabel: UILabel = { createLabel(forFont: .body7,
                                                                      forColor: .naverMapBlack,
                                                                      text: "알림을 받아보세요!")}()
    private let alarmBtn = UIButton()
    
    private let horizDividingLine2 = UIView()
    
    /// 전체 정보(설명) 스택뷰
    private let descriptionStackView = UIStackView()
    
    /// 위치 스택뷰
    private let locationHorizStackView = UIStackView()
    private let locationIc: UIImageView = UIImageView(image: ImageLiterals.ic_location_ios)
    private lazy var locationVerticStackView: UIStackView = { createVerticStackView(forSpacing: 3) }()
    
    private lazy var addressHorizStackView: UIStackView = { createHorizStackView(forSpacing: 3) }()
    public var addressLabel = UILabel()
    
    private let moreAddressBtn = UIButton()
    private let detailLocationView = DetailLocationView()
    
    private lazy var routeHorizStackView: UIStackView = { createHorizStackView(forSpacing: 3) }()
    private let metroIc: UIImageView = UIImageView(image: ImageLiterals.ic_number_circle)
    public var routeLabel = UILabel()
    
    /// 영업시간 스택뷰
    private lazy var hourHorizStackView: UIStackView = { createHorizStackView(forSpacing: 10) }()
    private let hourIc: UIImageView = UIImageView(image: ImageLiterals.ic_clock)
    private lazy var isOpenedLabel: UILabel = { createLabel(forFont: .bodyButton,
                                                                forColor: .naverMapNaverGreen,
                                                                text: "영업 중")}()
    public var lastOrderLabel = UILabel()
    
    /// 전화번호 스택뷰
    private lazy var callHorizStackView: UIStackView = { createHorizStackView(forSpacing: 10) }()
    private let callIc: UIImageView = UIImageView(image: ImageLiterals.ic_call)
    public var callNumberLabel = UILabel()
    private lazy var callCopyLabel: UILabel = { createLabel(forFont: .bodyButton,
                                                            forColor: .naverMapSubBlue,
                                                            text: "복사")}()
    
    /// 옵션 스택뷰
    private lazy var optionHorizStackView: UIStackView = { createHorizStackView(forSpacing: 10) }()
    private let optionIc: UIImageView = UIImageView(image: ImageLiterals.ic_home)
    public var optionLabel = UILabel()
    
    /// URL 스택뷰
    private lazy var urlHorizStackView: UIStackView = { createHorizStackView(forSpacing: 10) }()
    private let urlIc: UIImageView = UIImageView(image: ImageLiterals.ic_webpage)
    public var urlLabel = UILabel()
    
    /// 상세 정보 스택뷰
    private let infoHorizStackView = UIStackView()
    private let infoIc: UIImageView = UIImageView(image: ImageLiterals.ic_information)
    public var infoLabel = UILabel()
    
    /// 정보 수정 스택뷰
    private lazy var editInfoHorizStackView: UIStackView = { createHorizStackView(forSpacing: 3) }()
    private let editIc: UIImageView = UIImageView(image: ImageLiterals.ic_write)
    private let editArrowIc: UIImageView = UIImageView(image: ImageLiterals.ic_arrow_right_16)
    private lazy var editLabel: UILabel = { createLabel(forFont: .bodyButton,
                                                        forColor: .naverMapSubBlue,
                                                        text: "정보 수정 제안하기") }()
    
    private let bottomDividingBar = UIView()
    
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
    
    @objc
    func showDetailLocation(_gesture: UIGestureRecognizer) {
        detailLocationView.isHidden.toggle()
    }
}

// MARK: - Bind Data Method

extension DescriptionSectionHeaderView {
    func bindData(data: GetPlaceResultDetailResponseDTO) {
        self.addressLabel.text = data.data.detailAddress
        self.routeLabel.text = data.data.direction
        self.lastOrderLabel.text = data.data.closeTime + "에 라스트오더"
        self.callNumberLabel.text = data.data.number
        self.optionLabel.text = data.data.characters
        self.urlLabel.text = data.data.sns
        self.infoLabel.text = data.data.detail
    }
}

// MARK: - Private method

private extension DescriptionSectionHeaderView {
    func setupStyle() {
        self.backgroundColor = .naverMapWhite
    }
    
    func setupViews() {
        self.addSubviews([headerHorizStackView,
                          horizDividingLine1,
                          alarmHorizStackView,
                          alarmBtn,
                          horizDividingLine2,
                          locationIc,
                          locationVerticStackView,
                          descriptionStackView,
                          detailLocationView,
                          editInfoHorizStackView,
                          bottomDividingBar])
        
        /// headerHorizStackView
        headerHorizStackView.addArrangedSubviews(homeStackView, menuStackView, reviewStackView)
        
        homeStackView.addArrangedSubviews(homeLabel, homeIndicator)
        
        menuStackView.addArrangedSubviews(menuLabel, menuIndicator)
        
        reviewStackView.addArrangedSubviews(reviewLabel, reviewIndicator)
        
        /// alarmHorizStackView
        alarmHorizStackView.addArrangedSubviews(alarmBoldDescriptLabel, alarmPlainDescriptLabel)
        
        descriptionStackView.addArrangedSubviews(locationHorizStackView,
                                                 hourHorizStackView,
                                                 callHorizStackView,
                                                 optionHorizStackView,
                                                 urlHorizStackView,
                                                 infoHorizStackView)
        
        locationHorizStackView.addArrangedSubviews(locationIc, locationVerticStackView)
        locationVerticStackView.addArrangedSubviews(addressHorizStackView, routeHorizStackView)
        addressHorizStackView.addArrangedSubviews(addressLabel, moreAddressBtn)
        routeHorizStackView.addArrangedSubviews(metroIc, routeLabel)
        
        hourHorizStackView.addArrangedSubviews(hourIc, isOpenedLabel, lastOrderLabel)
        callHorizStackView.addArrangedSubviews(callIc, callNumberLabel, callCopyLabel)
        optionHorizStackView.addArrangedSubviews(optionIc, optionLabel)
        urlHorizStackView.addArrangedSubviews(urlIc, urlLabel)
        infoHorizStackView.addArrangedSubviews(infoIc, infoLabel)
        
        /// editInfoHorizStackView
        editInfoHorizStackView.addArrangedSubviews(editIc, editLabel, editArrowIc)
    }
    
    func setupConstraints() {
        headerHorizStackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.bottom.equalTo(homeStackView.snp.bottom)
            $0.centerX.equalToSuperview()
        }
        
        horizDividingLine1.snp.makeConstraints {
            $0.top.equalTo(homeIndicator.snp.bottom)
            $0.width.equalTo(getDeviceWidth())
            $0.height.equalTo(1)
            $0.centerX.equalToSuperview()
        }
        
        alarmHorizStackView.snp.makeConstraints {
            $0.top.equalTo(horizDividingLine1.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(16)
        }
        
        alarmBtn.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.width.equalTo(105)
            $0.height.equalTo(40)
            $0.centerY.equalTo(alarmHorizStackView)
        }
        
        horizDividingLine2.snp.makeConstraints {
            $0.top.equalTo(alarmBtn.snp.bottom).offset(16)
            $0.width.equalTo(getDeviceWidth())
            $0.height.equalTo(1)
            $0.centerX.equalToSuperview()
        }
        
        detailLocationView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.top.equalTo(moreAddressBtn.snp.bottom).offset(3)
            $0.centerX.equalToSuperview()
        }
        
        descriptionStackView.snp.makeConstraints {
            $0.top.equalTo(horizDividingLine2.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(18)
            $0.width.equalTo(336)
        }
        
        editInfoHorizStackView.snp.makeConstraints {
            $0.top.equalTo(descriptionStackView.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(18)
        }
        
        bottomDividingBar.snp.makeConstraints {
            $0.top.equalTo(editInfoHorizStackView.snp.bottom).offset(18)
            $0.width.equalTo(getDeviceWidth())
            $0.height.equalTo(10)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setupProperties() {
        addressLabel.setupLabel(font: .bodyButton, textColor: .naverMapGray4)
        routeLabel.setupLabel(font: .bodyButton, textColor: .naverMapGray4)
        callNumberLabel.setupLabel(font: .bodyButton, textColor: .naverMapGray6)
        lastOrderLabel.setupLabel(font: .bodyButton, textColor: .naverMapGray7)
        optionLabel.setupLabel(font: .bodyButton, textColor: .naverMapGray6)
        urlLabel.setupLabel(font: .bodyButton, textColor: .naverMapSubBlue)

        descriptionStackView.do {
            $0.axis = .vertical
            $0.spacing = 12
            $0.distribution = .equalSpacing
            $0.alignment = .leading
        }
        
        locationHorizStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
            $0.distribution = .equalSpacing
            $0.alignment = .top
        }
        
        horizDividingLine1.do {
            $0.backgroundColor = .naverMapBlueGray2
        }
        
        alarmBtn.do {
            $0.setTitle("알림받기", for: .normal)
            $0.setTitleColor(.naverMapGray6, for: .normal)
            $0.setImage(ImageLiterals.ic_alarm, for: .normal)
            $0.titleLabel?.font = .body7
            $0.backgroundColor = .naverMapWhite
            $0.layer.borderColor = UIColor.naverMapGray2.cgColor
            $0.layer.cornerRadius = 8
            $0.layer.borderWidth = 1
        }
        
        infoLabel.do {
            $0.font = .bodyButton
            $0.textColor = .naverMapGray6
            $0.numberOfLines = 0
        }
        
        horizDividingLine2.do {
            $0.backgroundColor = .naverMapBlueGray2
        }
        
        detailLocationView.do {
            $0.isHidden = true
        }
        
        moreAddressBtn.do {
            $0.setImage(ImageLiterals.ic_arrow_down, for: .normal)
        }
        
        bottomDividingBar.do {
            $0.backgroundColor = .naverMapGray1
        }
        infoHorizStackView.do {
            $0.axis = .horizontal
            $0.spacing = 10
            $0.alignment = .top
        }
    }
    
    func setAddTarget() {
        moreAddressBtn.addTarget(self, action: #selector(showDetailLocation), for: .touchUpInside)
    }
    
    // MARK: - create UI components method
    
    func createVerticStackView(forSpacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = forSpacing
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }
    
    func createHorizStackView(forSpacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = forSpacing
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }
    
    func createLabel(forFont: UIFont, forColor: UIColor, text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.font = forFont
        label.text = text
        label.textColor = forColor
        return label
    }
    
    func createIndicator(forColor: UIColor) -> UIView {
        let indicator = UIView()
        indicator.backgroundColor = forColor
        indicator.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(1)
        }
        return indicator
    }
}
