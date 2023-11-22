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
    private var buttonConfig = UIButton.Configuration.filled() // 이걸 여기에? 아니면 메서드 안에?
    
    // MARK: - UI Properties
    
    private let paginatorBtn = UIButton()
    
    private lazy var imagesHorizontalStackView: UIStackView = { createHorizontalStackView(forSpacing: 2) }()
    private lazy var imagesVerticalStackView1: UIStackView = { createVerticalStackView(forSpacing: 2) }()
    private lazy var imagesVerticalStackView2: UIStackView = { createVerticalStackView(forSpacing: 2) }()
    
    private lazy var bigMenuImage: UIImageView = { fetchBigImageLayout(image: ImageLiterals.ic_food) }()
    private lazy var smallMenuImage1: UIImageView = { fetchImageLayout(image: ImageLiterals.ic_btn_location_white)}()
    private lazy var smallMenuImage2: UIImageView = { fetchImageLayout(image: ImageLiterals.ic_btn_location_white) }()
    private lazy var smallMenuImage3: UIImageView = { fetchImageLayout(image: ImageLiterals.ic_btn_location_white) }()
    private lazy var smallMenuImage4: UIImageView = { fetchImageLayout(image: ImageLiterals.ic_btn_location_white)}()
    private lazy var imageIc: UIImageView = { createIcon(image: ImageLiterals.ic_picture) }()
    private lazy var imagesCountLabel = createLabel(forFont: UIFont.bodyButton, forColor: UIColor.naverMapWhite, text: "+4")
    
    private lazy var locationNameLabel: UILabel = { createLabel(forFont: UIFont.title2, forColor: UIColor.naverMapBlack, text: "알고")}()
    private lazy var categoryLabel: UILabel = { createLabel(forFont: UIFont.body7, forColor: UIColor.naverMapGray4, text: "스파게티, 파스타 전문")}()
    private lazy var descriptionLabel: UILabel = { createLabel(forFont: UIFont.body7,
                                                               forColor: UIColor.naverMapGray6,
                                                               text: "수제맥주를 즐길 수 있는 어린이대공원 파스타 맛집")}()
    
    private lazy var rateIc: UIImageView = { createIcon(image: ImageLiterals.ic_star_red) }()
    private lazy var rateLabel: UILabel = { createLabel(forFont: UIFont.body7, forColor: UIColor.naverMapGray7, text: "4.82")}()
    
    private let mainStackView = UIStackView()
    private lazy var visitorReviewBtn = createReviewBtn(title: "방문자리뷰 288")
    private lazy var blogReviewBtn = createReviewBtn(title: "블로그리뷰 316")
    
    private lazy var mapBtnStackView: UIStackView = { createHorizontalStackView(forSpacing: 6) }()
    private let departureBtn = UIButton()
    private let arrivalBtn = UIButton()
    
    private lazy var horizontalDividingLine: UIView = { createDividingLine(forHeight: 1, forWidth: 343) }()
    
    private lazy var allMenusStackView: UIStackView = { createHorizontalStackView(forSpacing: 29) }()
    
    private lazy var callStackView: UIStackView = { createVerticalStackView(forSpacing: 6) }()
    private lazy var callIc: UIImageView = { createIcon(image: ImageLiterals.ic_call_thick) }()
    private lazy var callMenuLabel: UILabel = { createLabel(forFont: UIFont.body10,
                                                            forColor: UIColor.naverMapGray6,
                                                            text: "전화")}()
    private lazy var verticalDividingLine1: UIView = { createDividingLine(forHeight: 46, forWidth: 1) }()
    
    private lazy var bookMarkStackView: UIStackView = { createVerticalStackView(forSpacing: 6) }()
    private lazy var bookMarkIc: UIImageView = { createIcon(image: ImageLiterals.ic_star_thick) }()
    private lazy var bookMarkMenuLabel: UILabel = { createLabel(forFont: UIFont.body10,
                                                                forColor: UIColor.naverMapGray6,
                                                                text: "저장")}()
    private lazy var verticalDividingLine2: UIView = { createDividingLine(forHeight: 46, forWidth: 1) }()
    
    private lazy var navigationStackView: UIStackView = { createVerticalStackView(forSpacing: 6) }()
    private lazy var navigationIc: UIImageView = { createIcon(image: ImageLiterals.ic_navigation) }()
    private lazy var navigationMenuLabel: UILabel = { createLabel(forFont: UIFont.body10,
                                                                  forColor: UIColor.naverMapGray6,
                                                                  text: "내비게이션")}()
    private lazy var verticalDividingLine3: UIView = { createDividingLine(forHeight: 46, forWidth: 1) }()
    
    
    private lazy var shareStackView: UIStackView = { createVerticalStackView(forSpacing: 6) }()
    private lazy var shareIc: UIImageView = { createIcon(image: ImageLiterals.ic_share) }()
    private lazy var shareMenuLabel: UILabel = { createLabel(forFont: UIFont.body10,
                                                             forColor: UIColor.naverMapGray6,
                                                             text: "공유")}()
    
    private lazy var naverBtnStackView: UIStackView = { createHorizontalStackView(forSpacing: 23) }()
    private lazy var bookingBtn = createNaverBtn(title: "예약", image: ImageLiterals.ic_naverbooking_24)
    private lazy var payBtn = createNaverBtn(title: "주문", image: ImageLiterals.ic_naverorder_24)
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupViews()
        setupLayout()
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
                          rateIc,
                          rateLabel,
                          visitorReviewBtn,
                          blogReviewBtn,
                          mapBtnStackView,
                          horizontalDividingLine,
                          allMenusStackView,
                          naverBtnStackView])
        imagesHorizontalStackView.addSubviews([paginatorBtn, imageIc, imagesCountLabel])
        
        imagesHorizontalStackView.addArrangedSubviews(bigMenuImage ,imagesVerticalStackView1, imagesVerticalStackView2)
        imagesVerticalStackView1.addArrangedSubviews(smallMenuImage1, smallMenuImage2)
        imagesVerticalStackView2.addArrangedSubviews(smallMenuImage3, smallMenuImage4)
        mapBtnStackView.addArrangedSubviews(visitorReviewBtn, blogReviewBtn)
        
        allMenusStackView.addArrangedSubviews(callStackView,
                                              verticalDividingLine1,
                                              bookMarkStackView,
                                              verticalDividingLine1,
                                              navigationStackView,
                                              verticalDividingLine1,
                                              shareStackView)
        
        callStackView.addArrangedSubviews(callIc, callMenuLabel)
        bookMarkStackView.addArrangedSubviews(bookMarkIc, bookMarkMenuLabel)
        navigationStackView.addArrangedSubviews(navigationIc, navigationMenuLabel)
        shareStackView.addArrangedSubviews(navigationIc, navigationMenuLabel)
        
        naverBtnStackView.addArrangedSubviews(bookingBtn, payBtn)
    }
    
    func setupLayout() {
        imagesHorizontalStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(188)
        }
        
        paginatorBtn.snp.makeConstraints {
            $0.top.equalTo(imagesHorizontalStackView).inset(8)
            $0.leading.equalTo(imagesHorizontalStackView).inset(16)
        }
        
        imageIc.snp.makeConstraints {
            $0.top.equalTo(imagesHorizontalStackView).inset(123)
            $0.trailing.equalTo(imagesHorizontalStackView).inset(36)
        }
        
        imagesCountLabel.snp.makeConstraints {
            $0.top.equalTo(imageIc).inset(4)
            $0.trailing.equalTo(imagesHorizontalStackView).inset(36)
        }
        
        locationNameLabel.snp.makeConstraints {
            $0.top.equalTo(imagesHorizontalStackView.snp.bottom).inset(21)
            $0.leading.equalToSuperview().inset(17)
        }
        
        categoryLabel.snp.makeConstraints {
            $0.top.equalTo(imagesHorizontalStackView.snp.bottom).inset(22)
            $0.leading.equalTo(locationNameLabel.snp.trailing).inset(4)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(locationNameLabel.snp.bottom).inset(8)
            $0.leading.equalToSuperview().inset(17)
        }
        
        rateIc.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).inset(18)
            $0.leading.equalToSuperview().inset(17)
        }
        
        rateLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).inset(15)
            $0.leading.equalTo(rateIc.snp.trailing).inset(2)
        }
        
        visitorReviewBtn.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).inset(13)
            $0.leading.equalTo(rateLabel.snp.trailing).inset(16)
        }
        
        blogReviewBtn.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).inset(13)
            $0.leading.equalTo(visitorReviewBtn.snp.trailing).inset(8)
        }
        
        mapBtnStackView.snp.makeConstraints {
            $0.top.equalTo(visitorReviewBtn.snp.bottom).inset(16)
            $0.centerX.equalToSuperview()
        }
        
        horizontalDividingLine.snp.makeConstraints {
            $0.top.equalTo(mapBtnStackView.snp.bottom).inset(18)
            $0.centerX.equalToSuperview()
        }
        
        allMenusStackView.snp.makeConstraints {
            $0.top.equalTo(horizontalDividingLine.snp.bottom).inset(9)
            $0.centerX.equalToSuperview()
        }
        
        naverBtnStackView.snp.makeConstraints {
            $0.top.equalTo(horizontalDividingLine.snp.bottom).inset(75)
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
            $0.layer.backgroundColor = UIColor.naverMapWhite.cgColor
            $0.layer.cornerRadius = 20
        }
        
        arrivalBtn.do {
            $0.setTitle("도착", for: .normal)
            $0.titleLabel?.font = UIFont.body7
            $0.setTitleColor(UIColor.naverMapWhite, for: .normal)
            $0.setImage(ImageLiterals.ic_btn_location_white, for: .normal)
            $0.layer.backgroundColor = UIColor.naverMapBlue.cgColor
            $0.layer.cornerRadius = 20
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
        let btn = UIButton(configuration: buttonConfig)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.naverMapGray7, for: .normal)
        btn.titleLabel?.font = UIFont.body7
        btn.layer.backgroundColor = UIColor.naverMapReview5.cgColor
        btn.layer.borderColor = UIColor.naverMapReview4.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 3
        return btn
    }
    
    func createNaverBtn(title: String, image: UIImage) -> UIButton {
        let btn = UIButton(configuration: buttonConfig)
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.naverMapGray6, for: .normal)
        btn.titleLabel?.font = UIFont.body7
        btn.layer.backgroundColor = UIColor.naverMapWhite.cgColor
        btn.layer.borderColor = UIColor.naverMapGray2.cgColor
        btn.layer.borderWidth = 1
        btn.layer.cornerRadius = 8
        btn.configuration?.contentInsets = NSDirectionalEdgeInsets.init(top: 8, leading: 55, bottom: 8, trailing: 55)
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
    
    func createDividingLine(forHeight: CGFloat, forWidth: CGFloat) -> UIView {
        let line = UIView()
        line.backgroundColor = UIColor.naverMapBlueGray2
        line.frame = CGRect(x: 0, y: 0, width: forWidth, height: forHeight)
        return line
    }
    
    func fetchImageLayout(image: UIImage) -> UIImageView {
        let img = UIImageView()
        img.snp.makeConstraints {
            $0.width.equalTo( getDeviceWidth() / 4 )
            $0.height.equalTo( getDeviceWidth() / 4 )
        }
        return img
    }
    
    func fetchBigImageLayout(image: UIImage) -> UIImageView {
        let img = UIImageView()
        img.snp.makeConstraints {
            $0.width.equalTo( getDeviceWidth() / 2 )
            $0.height.equalTo( getDeviceWidth() / 2 )
        }
        return img
    }
}
