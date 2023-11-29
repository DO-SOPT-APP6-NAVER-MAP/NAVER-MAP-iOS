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
    private lazy var addressLabel: UILabel = { createLabel(forFont: .bodyButton,
                                                           forColor: .naverMapGray4,
                                                           text: "서울 광진구 광나루로17길 10 2층")}()
    private let moreAddressBtn = UIButton()
    private let detailLocationView = DetailLocationView()
    
    private lazy var routeHorizStackView: UIStackView = { createHorizStackView(forSpacing: 3) }()
    private let metroIc: UIImageView = UIImageView(image: ImageLiterals.ic_number_circle)
    private lazy var routeLabel: UILabel = { createLabel(forFont: .bodyButton,
                                                         forColor: .naverMapGray6,
                                                         text: "어린이대공원역 5번 출구에서 187m")}()
    
    /// 영업시간 스택뷰
    private lazy var hourHorizStackView: UIStackView = { createHorizStackView(forSpacing: 10) }()
    private let hourIc: UIImageView = UIImageView(image: ImageLiterals.ic_clock)
    private lazy var isOpenedLabel: UILabel = { createLabel(forFont: .bodyButton,
                                                         forColor: .naverMapNaverGreen,
                                                         text: "영업 중")}()
    private lazy var lastOrderLabel: UILabel = { createLabel(forFont: .bodyButton,
                                                         forColor: .naverMapGray7,
                                                         text: "22:00에 라스트오더")}()
    
    /// 전화번호 스택뷰
    private lazy var callHorizStackView: UIStackView = { createHorizStackView(forSpacing: 10) }()
    private let callIc: UIImageView = UIImageView(image: ImageLiterals.ic_call)
    private lazy var callNumberLabel: UILabel = { createLabel(forFont: .bodyButton,
                                                         forColor: .naverMapGray6,
                                                         text: "02-3409-2654")}()
    private lazy var callCopyLabel: UILabel = { createLabel(forFont: .bodyButton,
                                                         forColor: .naverMapSubBlue,
                                                         text: "복사")}()
    
    /// 옵션 스택뷰
    private lazy var optionHorizStackView: UIStackView = { createHorizStackView(forSpacing: 10) }()
    private let optionIc: UIImageView = UIImageView(image: ImageLiterals.ic_home)
    private lazy var optionLabel: UILabel = { createLabel(forFont: .bodyButton,
                                                          forColor: .naverMapGray6,
                                                          text: "무선 인터넷, 주차, 포장, 배달, 반려동물 동반, 예약") }()
    
    /// URL 스택뷰
    private lazy var urlHorizStackView: UIStackView = { createHorizStackView(forSpacing: 10) }()
    private let urlIc: UIImageView = UIImageView(image: ImageLiterals.ic_webpage)
    private lazy var urlLabel: UILabel = { createLabel(forFont: .bodyButton,
                                                       forColor: .naverMapSubBlue,
                                                       text: "https://www.instagram.com/algo_taphouse") }()
    
    /// 상세 정보 스택뷰
    private let infoHorizStackView = UIStackView()
    private let infoIc: UIImageView = UIImageView(image: ImageLiterals.ic_information)
    private let infoLabel = UILabel()
    
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
        detailLocationView.isHidden = !detailLocationView.isHidden
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
            $0.height.equalTo(55)
            $0.width.equalTo(312)
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
            $0.text = "안녕하세요. 부담없는 가격과 맛있는 맛으로 여러분께 다가가는 파스타 및 맥주 전문점 알고입니다. 편안한 한 끼 식사, 편안한 한 잔의 맥주로 여러분의 하루를 마무리하세요."
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
