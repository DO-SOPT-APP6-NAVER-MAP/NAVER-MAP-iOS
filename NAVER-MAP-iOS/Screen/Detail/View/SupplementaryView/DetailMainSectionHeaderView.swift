//
//  DetailMainSectionHeaderView.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/21/23.
//

import UIKit

import Then
import SnapKit

class DetailMainSectionHeaderView: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let identifier = "DetailMainSectionHeaderView"
    
    // MARK: - UI Properties
    
    private let paginatorBtn = UIButton()
    
    private lazy var imagesHorizontalStackView: UIStackView = { createHorizontalStackView(forSpacing: 2) }()
    private lazy var imagesVerticalStackView1: UIStackView = { createVerticalStackView(forSpacing: 2) }()
    private lazy var imagesVerticalStackView2: UIStackView = { createVerticalStackView(forSpacing: 2) }()
    
    private lazy var bigMenuImage: UIImageView = { fetchBigImageLayout(image: ImageLiterals.ic_naverbooking) }()
    private lazy var smallMenuImage1: UIImageView = { fetchImageLayout(image: ImageLiterals.ic_naverbooking)}()
    private lazy var smallMenuImage2: UIImageView = { fetchImageLayout(image: ImageLiterals.ic_naverbooking) }()
    private lazy var smallMenuImage3: UIImageView = { fetchImageLayout(image: ImageLiterals.ic_naverbooking) }()
    private lazy var smallMenuImage4: UIImageView = { fetchImageLayout(image: ImageLiterals.ic_naverbooking)}()
    
    private lazy var imageIcVerticalStackView: UIStackView = { createVerticalStackView(forSpacing: 4)}()
    private lazy var imageIc: UIImageView = { createIcon(image: ImageLiterals.ic_picture) }()
    private lazy var imagesCountLabel = createLabel(forFont: UIFont.bodyButton, forColor: UIColor.naverMapWhite, text: "+4")
    
    private lazy var locationNameLabel: UILabel = { createLabel(forFont: UIFont.title2, forColor: UIColor.naverMapBlack, text: "알고")}()
    private lazy var categoryLabel: UILabel = { createLabel(forFont: UIFont.body7, forColor: UIColor.naverMapGray4, text: "스파게티, 파스타 전문")}()
    private lazy var descriptionLabel: UILabel = { createLabel(forFont: UIFont.body7,
                                                               forColor: UIColor.naverMapGray6,
                                                               text: "수제맥주를 즐길 수 있는 어린이대공원 파스타 맛집")}()
    
    private lazy var rateStackView: UIStackView = { createHorizontalStackView(forSpacing: 2)}()
    private lazy var rateIc: UIImageView = { createIcon(image: ImageLiterals.ic_star_red) }()
    private lazy var rateLabel: UILabel = { createLabel(forFont: UIFont.body7, forColor: UIColor.naverMapGray7, text: "4.82")}()
    
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
    private lazy var callIc: UIImageView = { createIcon(image: ImageLiterals.ic_call_thick) }()
    private lazy var callMenuLabel: UILabel = { createLabel(forFont: UIFont.body10,
                                                            forColor: UIColor.naverMapGray6,
                                                            text: "전화")}()
    
    private lazy var bookMarkStackView: UIStackView = { createVerticalStackView(forSpacing: 6) }()
    private lazy var bookMarkIc: UIImageView = { createIcon(image: ImageLiterals.ic_star_thick) }()
    private lazy var bookMarkMenuLabel: UILabel = { createLabel(forFont: UIFont.body10,
                                                                forColor: UIColor.naverMapGray6,
                                                                text: "저장")}()
    
    private lazy var navigationStackView: UIStackView = { createVerticalStackView(forSpacing: 6) }()
    private lazy var navigationIc: UIImageView = { createIcon(image: ImageLiterals.ic_navigation) }()
    private lazy var navigationMenuLabel: UILabel = { createLabel(forFont: UIFont.body10,
                                                                  forColor: UIColor.naverMapGray6,
                                                                  text: "내비게이션")}()
    
    private lazy var shareStackView: UIStackView = { createVerticalStackView(forSpacing: 6) }()
    private lazy var shareIc: UIImageView = { createIcon(image: ImageLiterals.ic_share) }()
    private lazy var shareMenuLabel: UILabel = { createLabel(forFont: UIFont.body10,
                                                             forColor: UIColor.naverMapGray6,
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private method

private extension DetailMainSectionHeaderView {
    func setupStyle() {
        self.backgroundColor = UIColor.naverMapWhite
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
            $0.top.equalTo(imagesHorizontalStackView.snp.bottom).offset(22)
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
        
        for i in [verticalDividingLine1, verticalDividingLine2, verticalDividingLine3] {
            i.snp.makeConstraints {
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
        paginatorBtn.do {
            $0.setImage(ImageLiterals.ic_arrow_left_g6, for: .normal)
        }
        
        departureBtn.do {
            $0.setTitle("출발", for: .normal)
            $0.titleLabel?.font = UIFont.body7
            $0.setTitleColor(UIColor.naverMapBlue, for: .normal)
            $0.setImage(ImageLiterals.ic_btn_depart_circle, for: .normal)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.naverMapBlue.cgColor
            $0.backgroundColor = UIColor.naverMapWhite
            $0.layer.cornerRadius = 20
        }
        
        arrivalBtn.do {
            $0.setTitle("도착", for: .normal)
            $0.titleLabel?.font = UIFont.body7
            $0.setTitleColor(UIColor.naverMapWhite, for: .normal)
            $0.setImage(ImageLiterals.ic_btn_location_white, for: .normal)
            $0.backgroundColor = UIColor.naverMapBlue
            $0.layer.cornerRadius = 20
        }
        
        for i in [horizontalDividingLine,
                  verticalDividingLine1,
                  verticalDividingLine2,
                  verticalDividingLine3] {
            i.backgroundColor = UIColor.naverMapGray2
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
        btn.setTitleColor(UIColor.naverMapGray7, for: .normal)
        btn.titleLabel?.font = UIFont.body7
        btn.backgroundColor = UIColor.naverMapReview5
        btn.layer.borderColor = UIColor.naverMapReview4.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 3
        return btn
    }
    
    func createNaverBtn(title: String, image: UIImage) -> UIButton {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.naverMapGray6, for: .normal)
        btn.setImage(image, for: .normal)
        btn.titleLabel?.font = UIFont.body7
        btn.backgroundColor = UIColor.naverMapWhite
        btn.layer.borderColor = UIColor.naverMapGray2.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 8
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
    
    func createIcon(image: UIImage) -> UIImageView {
        let ic = UIImageView()
        ic.image = image
        return ic
    }
    
    func fetchImageLayout(image: UIImage) -> UIImageView {
        let img = UIImageView()
        img.snp.makeConstraints {
            $0.width.equalTo( getDeviceWidth() / 4 )
            $0.height.equalTo( getDeviceWidth() / 4 )
        }
        img.image = image
        return img
    }
    
    func fetchBigImageLayout(image: UIImage) -> UIImageView {
        let img = UIImageView()
        img.snp.makeConstraints {
            $0.width.equalTo( getDeviceWidth() / 2 )
            $0.height.equalTo( getDeviceWidth() / 2 )
        }
        img.image = image
        return img
    }
}
