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
