//
//  DetailMainSectionHeaderView.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/21/23.
//

import UIKit

import Then
import SnapKit

protocol MainSectionHeaderViewDelegate: AnyObject {
    func scrollToVisitorSection()
    func scrollToBlogSection()
}

class DetailMainSectionHeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let identifier = "DetailMainSectionHeaderView"
    weak var delegate: MainSectionHeaderViewDelegate?
    
    // MARK: - UI Properties
    
    private let paginatorBtn = UIButton()
    
    private lazy var imagesHorizontalStackView: UIStackView = { createHorizontalStackView(forSpacing: 2) }()
    private lazy var imagesVerticalStackView1: UIStackView = { createVerticalStackView(forSpacing: 2) }()
    private lazy var imagesVerticalStackView2: UIStackView = { createVerticalStackView(forSpacing: 2) }()
    
    private let bigMenuImage = UIImageView()
    private let smallMenuImage1 = UIImageView()
    private let smallMenuImage2 = UIImageView()
    private let smallMenuImage3 = UIImageView()
    private let smallMenuImage4 = UIImageView()
    
    private lazy var imageIcVerticalStackView: UIStackView = { createVerticalStackView(forSpacing: 4)}()
    private let imageIc: UIImageView = UIImageView(image: ImageLiterals.ic_picture)
    private lazy var imagesCountLabel = createLabel(forFont: .bodyButton, forColor: .naverMapWhite, text: "+4")
    
    public var locationNameLabel = UILabel()
    public var categoryLabel = UILabel()
    public var descriptionLabel = UILabel()
    
    private lazy var rateStackView: UIStackView = { createHorizontalStackView(forSpacing: 2)}()
    private let rateIc: UIImageView = UIImageView(image: ImageLiterals.ic_star_red)
    public var rateLabel = UILabel()
    
    private lazy var visitorReviewBtn = createReviewBtn(title: "방문자리뷰 288")
    private lazy var blogReviewBtn = createReviewBtn(title: "블로그리뷰 316")
    
    private lazy var mapBtnStackView: UIStackView = { createHorizontalStackView(forSpacing: 6) }()
    private let departureBtn = UIButton()
    private let arrivalBtn = UIButton()
    
    private let horizontalDividingLine = UIView()
    private let verticalDividingLine1 = UIView()
    private let verticalDividingLine2 = UIView()
    private let verticalDividingLine3 = UIView()

    private lazy var allMenusStackView: UIStackView = { createHorizontalStackView(forSpacing: 29) }()
    
    private lazy var callStackView: UIStackView = { createVerticalStackView(forSpacing: 6) }()
    private let callIc: UIImageView = UIImageView(image: ImageLiterals.ic_call_thick)
    private lazy var callMenuLabel: UILabel = { createLabel(forFont: .body10,
                                                            forColor: .naverMapGray6,
                                                            text: "전화")}()
    
    private lazy var bookMarkStackView: UIStackView = { createVerticalStackView(forSpacing: 6) }()
    private let bookMarkIc: UIImageView = UIImageView(image: ImageLiterals.ic_star_thick)
    private lazy var bookMarkMenuLabel: UILabel = { createLabel(forFont: .body10,
                                                                forColor: .naverMapGray6,
                                                                text: "저장")}()
    
    private lazy var navigationStackView: UIStackView = { createVerticalStackView(forSpacing: 6) }()
    private let navigationIc: UIImageView = UIImageView(image: ImageLiterals.ic_navigation)
    private lazy var navigationMenuLabel: UILabel = { createLabel(forFont: .body10,
                                                                  forColor: .naverMapGray6,
                                                                  text: "내비게이션")}()
    
    private lazy var shareStackView: UIStackView = { createVerticalStackView(forSpacing: 6) }()
    private let shareIc: UIImageView = UIImageView(image: ImageLiterals.ic_share)
    private lazy var shareMenuLabel: UILabel = { createLabel(forFont: .body10,
                                                             forColor: .naverMapGray6,
                                                             text: "공유")}()
    
    private lazy var naverBtnStackView: UIStackView = { createHorizontalStackView(forSpacing: 23) }()
    private lazy var bookingBtn = createNaverBtn(title: "예약", image: ImageLiterals.ic_naverbooking_24)
    private lazy var payBtn = createNaverBtn(title: "주문", image: ImageLiterals.ic_naverorder_24)
    
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
    func visitorBtnTapped() {
        delegate?.scrollToVisitorSection()
    }
    
    @objc
    func blogBtnTapped() {
        delegate?.scrollToBlogSection()
    }
}

// MARK: - Bind Data Method

extension DetailMainSectionHeaderView {
    func bindData(data: GetPlaceResultDetailResponseDTO) {
        self.locationNameLabel.text = data.data.name
        self.categoryLabel.text = data.data.category
        self.descriptionLabel.text = data.data.description
        self.rateLabel.text = data.data.stars
    }
}

// MARK: - Private method

private extension DetailMainSectionHeaderView {
    
    func setupStyle() {
        self.backgroundColor = .naverMapWhite
    }
    
    func setupViews() {
        self.addSubviews([imagesHorizontalStackView,
                          locationNameLabel,
                          categoryLabel,
                          descriptionLabel,
                          rateStackView,
                          visitorReviewBtn,
                          blogReviewBtn,
                          mapBtnStackView,
                          horizontalDividingLine,
                          allMenusStackView,
                          naverBtnStackView,
                          bottomDividingBar])
        
        imagesHorizontalStackView.addArrangedSubviews(bigMenuImage,
                                                      imagesVerticalStackView1,
                                                      imagesVerticalStackView2)
        imagesVerticalStackView1.addArrangedSubviews(smallMenuImage1, smallMenuImage2)
        imagesVerticalStackView2.addArrangedSubviews(smallMenuImage3, smallMenuImage4)
        imagesHorizontalStackView.addSubviews([paginatorBtn,
                                               imageIcVerticalStackView])
        
        imageIcVerticalStackView.addArrangedSubviews(imageIc, imagesCountLabel)
        
        rateStackView.addArrangedSubviews(rateIc, rateLabel)
        
        mapBtnStackView.addArrangedSubviews(departureBtn, arrivalBtn)

        allMenusStackView.addArrangedSubviews(callStackView,
                                              verticalDividingLine1,
                                              bookMarkStackView,
                                              verticalDividingLine2,
                                              navigationStackView,
                                              verticalDividingLine3,
                                              shareStackView)
                
        callStackView.addArrangedSubviews(callIc, callMenuLabel)
        bookMarkStackView.addArrangedSubviews(bookMarkIc, bookMarkMenuLabel)
        navigationStackView.addArrangedSubviews(navigationIc, navigationMenuLabel)
        shareStackView.addArrangedSubviews(shareIc, shareMenuLabel)
        
        naverBtnStackView.addArrangedSubviews(bookingBtn, payBtn)
    }
    
    func setupConstraints() {
        imagesHorizontalStackView.snp.makeConstraints {
            $0.top.leading.width.equalToSuperview()
            $0.height.equalTo(188)
        }
        
        bigMenuImage.snp.makeConstraints {
            $0.size.equalTo(getDeviceWidth() / 2)
        }
        
        [smallMenuImage1, smallMenuImage2, smallMenuImage3, smallMenuImage4].forEach {
            $0.snp.makeConstraints {
                $0.size.equalTo(getDeviceWidth() / 4)
            }
        }
        
        paginatorBtn.snp.makeConstraints {
            $0.top.equalTo(imagesHorizontalStackView).inset(8)
            $0.leading.equalTo(imagesHorizontalStackView).inset(16)
        }
        
        imageIcVerticalStackView.snp.makeConstraints {
            $0.top.equalTo(imagesHorizontalStackView).offset(123)
            $0.trailing.equalTo(imagesHorizontalStackView).inset(36)
        }
        
        locationNameLabel.snp.makeConstraints {
            $0.top.equalTo(imagesHorizontalStackView.snp.bottom).offset(21)
            $0.leading.equalToSuperview().inset(17)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.centerY.equalTo(locationNameLabel)
            $0.leading.equalTo(locationNameLabel.snp.trailing).offset(4)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(locationNameLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(17)
        }
        
        rateStackView.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(18)
            $0.leading.equalToSuperview().inset(17)
        }

        visitorReviewBtn.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(14)
            $0.leading.equalTo(rateLabel.snp.trailing).offset(16)
            $0.width.equalTo(104)
            $0.height.equalTo(23)
        }
        
        blogReviewBtn.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(14)
            $0.leading.equalTo(visitorReviewBtn.snp.trailing).offset(8)
            $0.width.equalTo(104)
            $0.height.equalTo(23)
        }
        
        mapBtnStackView.snp.makeConstraints {
            $0.top.equalTo(visitorReviewBtn.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
        
        arrivalBtn.snp.makeConstraints {
            $0.width.equalTo(94)
            $0.height.equalTo(36)
        }
        
        departureBtn.snp.makeConstraints {
            $0.width.equalTo(94)
            $0.height.equalTo(36)
        }
        
        horizontalDividingLine.snp.makeConstraints {
            $0.top.equalTo(mapBtnStackView.snp.bottom).offset(18)
            $0.centerX.equalToSuperview()
        }
        
        allMenusStackView.snp.makeConstraints {
            $0.top.equalTo(horizontalDividingLine.snp.bottom).offset(9)
            $0.centerX.equalToSuperview()
        }
        
        naverBtnStackView.snp.makeConstraints {
            $0.top.equalTo(horizontalDividingLine.snp.bottom).offset(75)
            $0.centerX.equalToSuperview()
        }
        
        bookingBtn.snp.makeConstraints {
            $0.width.equalTo(160)
            $0.height.equalTo(40)
        }
        
        payBtn.snp.makeConstraints {
            $0.width.equalTo(160)
            $0.height.equalTo(40)
        }
        
        horizontalDividingLine.snp.makeConstraints {
            $0.width.equalTo(343)
            $0.height.equalTo(1)
        }
        
        [verticalDividingLine1, verticalDividingLine2, verticalDividingLine3].forEach {
            $0.snp.makeConstraints {
                $0.width.equalTo(1)
                $0.height.equalTo(46)
            }
        }
        
        bottomDividingBar.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.height.equalTo(10)
            $0.top.equalTo(naverBtnStackView.snp.bottom).offset(16)
            $0.centerX.equalToSuperview()
        }
    }
    
    func setupProperties() {
        locationNameLabel.setupLabel(font: .title2, textColor: .naverMapBlack)
        categoryLabel.setupLabel(font: .body7, textColor: .naverMapGray4)
        descriptionLabel.setupLabel(font: .body7, textColor: .naverMapGray6)
        rateLabel.setupLabel(font: .body7, textColor: .naverMapGray7)
        
        paginatorBtn.do {
            $0.setImage(ImageLiterals.ic_arrow_left_g6, for: .normal)
        }
        
        departureBtn.do {
            $0.setTitle("출발", for: .normal)
            $0.titleLabel?.font = .body7
            $0.setTitleColor(.naverMapBlue, for: .normal)
            $0.setImage(ImageLiterals.ic_btn_depart_circle, for: .normal)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.naverMapBlue.cgColor
            $0.backgroundColor = .naverMapWhite
            $0.layer.cornerRadius = 20
        }
        
        arrivalBtn.do {
            $0.setTitle("도착", for: .normal)
            $0.titleLabel?.font = .body7
            $0.setTitleColor(.naverMapWhite, for: .normal)
            $0.setImage(ImageLiterals.ic_btn_location_white, for: .normal)
            $0.backgroundColor = .naverMapBlue
            $0.layer.cornerRadius = 20
        }
        
        [horizontalDividingLine, verticalDividingLine1, verticalDividingLine2, verticalDividingLine3].forEach {
            $0.do {
                $0.backgroundColor = .naverMapGray2
            }
        }
        
        [bigMenuImage, smallMenuImage1, smallMenuImage2, smallMenuImage2, smallMenuImage3, smallMenuImage4].forEach {
            $0.do {
                $0.image = ImageLiterals.ic_naverbooking
            }
        }
        
        bottomDividingBar.do {
            $0.backgroundColor = .naverMapGray1
        }
        
        bottomDividingBar.do {
            $0.backgroundColor = UIColor.naverMapGray1
        }
    }
    
    // MARK: - create UI components method
    
    func createVerticalStackView(forSpacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = forSpacing
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }
    
    func createHorizontalStackView(forSpacing: CGFloat) -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = forSpacing
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }
    
    func createReviewBtn(title: String) -> UIButton { //inset 주기
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.naverMapGray7, for: .normal)
        btn.titleLabel?.font = .body7
        btn.backgroundColor = .naverMapReview5
        btn.layer.borderColor = UIColor.naverMapReview4.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 3
        btn.isUserInteractionEnabled = true
        return btn
    }
    
    func createNaverBtn(title: String, image: UIImage) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.naverMapGray6, for: .normal)
        btn.setImage(image, for: .normal)
        btn.titleLabel?.font = .body7
        btn.backgroundColor = .naverMapWhite
        btn.layer.borderColor = UIColor.naverMapGray2.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 8
        btn.isUserInteractionEnabled = true
        return btn
    }
    
    func createLabel(forFont: UIFont, forColor: UIColor, text: String) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.font = forFont
        label.text = text
        label.textColor = forColor
        return label
    }
    
    func setAddTarget() {
        visitorReviewBtn.addTarget(self, action: #selector(visitorBtnTapped), for: .touchUpInside)
        blogReviewBtn.addTarget(self, action: #selector(blogBtnTapped), for: .touchUpInside)
    }
}

extension DetailMainSectionHeaderView {
    
    // MARK: - Bind Data Method
    
//    func bindData(model: LocationModel) {
//        self.bigMenuImage.image = model.imageURL1
//        self.smallMenuImage1.image = model.imageURL2
//        self.smallMenuImage2.image = model.imageURL3
//        self.smallMenuImage3.image = model.imageURL4
//        self.smallMenuImage4.image = model.imageURL5
//        self.locationNameLabel.text = model.name
//    }
}
