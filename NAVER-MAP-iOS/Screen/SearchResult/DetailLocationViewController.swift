import UIKit

import SnapKit
import Then

class DetailLocationViewController: UIViewController {

    // MARK: UI Properties
    
    private var bottomSheetView = UIView()
    private var stackView = UIStackView()
    private var dragIcon = UIView()
    private var topIconGroup = UIStackView()
    private var pay = UIButton()
    private var booking = UIButton()
    private var order = UIButton()
    private var resultTitleGroup = UIView()
    private var name = UILabel()
    private var category = UILabel()
    private var detail = UILabel()
    private var locationInfoGroup = UIView()
    private var distance = UILabel()
    private var dot = UIView()
    private var location = UILabel()
    private var dropBtn = UIButton()
    private var resultInfoGroup = UIView()
    private var status = UILabel()
    private var lastOrder = UILabel()
    private var reviewGroup = UIView()
    private var reviewIcon = UIButton()
    private var score = UILabel()
    private var visitorReview = UILabel()
    private var blogReview = UILabel()
    private var imgGroup = UIStackView()
    private var img1 = UIImageView()
    private var img2 = UIImageView()
    private var img3 = UIImageView()
    private var divider = UIView()
    private var bottomView = UIView()
    private var bottomIconGroup = UIStackView()
    private var reservation = UIButton()
    private var contact = UIButton()
    private var favorites = UIButton()
    private var share = UIButton()
    private var btnGroup = UIStackView()
    private var departure = UILabel()
    private var arrival = UILabel()
    private var detailLocationView = DetailLocationView()
    
    // MARK: Properties

    private var hidden = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
        setupStyle()
    }
    
    func setupView() {
        self.view.addSubviews([bottomSheetView, detailLocationView])
        bottomSheetView.addSubviews([dragIcon, stackView, divider, bottomView])
        stackView.addArrangedSubviews(resultTitleGroup, detail, locationInfoGroup, resultInfoGroup, reviewGroup, imgGroup)
        stackView.addSubview(topIconGroup)
        topIconGroup.addArrangedSubviews(pay, booking, order)
        resultTitleGroup.addSubviews([name, category])
        locationInfoGroup.addSubviews([distance, dot, location, dropBtn])
        resultInfoGroup.addSubviews([status, lastOrder])
        reviewGroup.addSubviews([reviewIcon, score, visitorReview, blogReview])
        imgGroup.addArrangedSubviews(img1, img2, img3)
        bottomView.addSubviews([bottomIconGroup, btnGroup])
        bottomIconGroup.addArrangedSubviews(reservation, contact, favorites, share)
        btnGroup.addArrangedSubviews(departure, arrival)

    }
    
    // MARK: - Layout

    func setupLayout() {
        ///하단 바텀시트뷰
        bottomSheetView.snp.makeConstraints{
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(self.view.convertByHeightRatio(399))
        }
        dragIcon.snp.makeConstraints{
            $0.top.equalToSuperview().inset(14)
            $0.width.equalTo(34)
            $0.height.equalTo(4.3)
            $0.centerX.equalToSuperview()
        }
        stackView.snp.makeConstraints{
            $0.top.equalTo(dragIcon.snp.bottom).offset(35)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(stackView.getDeviceHeight() / 3)
        }
        
        ///상단 네이버 아이콘 그룹
        topIconGroup.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.width.equalTo(126)
            $0.height.equalTo(13)
            $0.top.equalTo(dragIcon.snp.bottom).offset(10)
        }
        
        ///검색 결과 이름 & 카테고리
        resultTitleGroup.snp.makeConstraints{
            $0.height.equalTo(20)
        }
        name.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.bottom.equalToSuperview()
        }
        category.snp.makeConstraints{
            $0.leading.equalTo(name.snp.trailing).offset(4)
            $0.top.bottom.equalToSuperview()
        }
        
        ///검색 결과 상세 설명
        detail.snp.makeConstraints{
            $0.height.equalTo(19)
            $0.leading.equalToSuperview()
        }
        
        ///검색 결과 위치정보
        locationInfoGroup.snp.makeConstraints{
            $0.height.equalTo(18)
        }
        distance.snp.makeConstraints{
            $0.leading.equalToSuperview()
        }
        dot.snp.makeConstraints{
            $0.leading.equalTo(distance.snp.trailing).offset(6)
            $0.width.height.equalTo(2)
            $0.centerY.equalToSuperview()
        }
        location.snp.makeConstraints{
            $0.leading.equalTo(dot.snp.trailing).offset(6)
        }
        dropBtn.snp.makeConstraints{
            $0.leading.equalTo(location.snp.trailing).offset(3)
            $0.width.height.equalTo(18)
        }
        
        ///상세 위치 정보
        detailLocationView.snp.makeConstraints{
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.top.equalTo(locationInfoGroup.snp.bottom).offset(4)
        }
        
        ///검색 결과 영업 정보
        resultInfoGroup.snp.makeConstraints{
            $0.height.equalTo(19)
        }
        status.snp.makeConstraints{
            $0.leading.equalToSuperview()
        }
        lastOrder.snp.makeConstraints{
            $0.leading.equalTo(status.snp.trailing).offset(16)
        }
        
        /// 리뷰 정보
        reviewGroup.snp.makeConstraints{
            $0.height.equalTo(23)
        }
        reviewIcon.snp.makeConstraints{
            $0.leading.centerY.equalToSuperview()
        }
        score.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(reviewIcon.snp.trailing).offset(2)
        }
        visitorReview.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(score.snp.trailing).offset(16)
            $0.width.equalTo(104)
        }
        blogReview.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.leading.equalTo(visitorReview.snp.trailing).offset(8)
            $0.width.equalTo(104)
        }
        
        ///리뷰 사진
        imgGroup.snp.makeConstraints{
            $0.height.equalTo(imgGroup.convertByHeightRatio(90))
        }
        
        ///구분선
        divider.snp.makeConstraints{
            $0.top.equalTo(stackView.snp.bottom).offset(14)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
        }
        
        ///하단 바텀뷰
        bottomView.snp.makeConstraints{
            $0.top.equalTo(divider.snp.bottom).offset(8)
            $0.height.equalTo(bottomView.convertByHeightRatio(31))
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        bottomIconGroup.snp.makeConstraints{
            $0.top.bottom.leading.equalToSuperview()
        }
        btnGroup.snp.makeConstraints{
            $0.centerY.trailing.equalToSuperview()
            $0.width.equalTo(btnGroup.convertByWidthRatio(138))
            $0.height.equalTo(btnGroup.convertByHeightRatio(31))
        }
    }
    
    // MARK: - Style
    
    func setupStyle() {
        self.view.backgroundColor = .naverMapWhite
        ///하단 바텀시트뷰
        bottomSheetView.do{
            let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(showDetailView(sender: )))
            $0.makeRounded(radius: 20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            $0.backgroundColor = .naverMapWhite
            $0.addGestureRecognizer(gestureRecognizer)
        }
        dragIcon.do{
            $0.layer.cornerRadius = 2
            $0.backgroundColor = .naverMapBlueGray4
        }
        stackView.setupStackView(bgColor: .naverMapWhite, axis: .vertical, distribution: .fillProportionally, spacing: stackView.convertByHeightRatio(9))
        
        topIconGroup.setupStackView(bgColor: .naverMapWhite, axis: .horizontal, distribution: .fill, spacing: 8)
        ///상단 네이버 아이콘 그룹
        pay.setImage(ImageLiterals.caption_naverpay, for: .normal)
        booking.setImage(ImageLiterals.caption_naverbooking, for: .normal)
        order.setImage(ImageLiterals.caption_naverorder, for: .normal)
        
        ///검색결과 이름 & 카테고리
        name.setupLabel(font: .title2, text: "알고", textColor: .naverMapSubBlue)
        category.setupLabel(font: .body10, text: "스파게티, 파스타전문", textColor: .naverMapGray4)
        
        ///검색 결과 이름 & 카테고리
        detail.setupLabel(font: .body7, text: "수제맥주를 즐길 수 있는 어린이대공원 파스타 맛집", textColor: .naverMapGray6, alignment: .left)
        
        ///검색 결과 위치정보
        distance.setupLabel(font: .body3, text: "936m", textColor: .naverMapGray6)
        dot.do{
            $0.layer.cornerRadius = 1
            $0.backgroundColor = .naverMapGray3
        }
        location.setupLabel(font: .bodyButton, text: "서울 광진구", textColor: .naverMapGray6)
        dropBtn.do{
            $0.setImage(ImageLiterals.ic_arrow_down, for: .normal)
            $0.addTarget(self, action: #selector(showDetailLocation), for: .touchUpInside)
        }
        detailLocationView.isHidden = hidden

        ///검색 결과 영업 정보
        status.setupLabel(font: .body6, text: "영업 중", textColor: .naverMapNaverGreen)
        lastOrder.setupLabel(font: .body7, text: "22:00에 라스트오더", textColor: .naverMapGray7)

        ///리뷰 정보
        reviewIcon.setImage(ImageLiterals.ic_star_red, for: .normal)
        score.setupLabel(font: .body7, text: "4.82", textColor: .naverMapGray7)
        visitorReview.setupRoundedLabel(text: "방문자리뷰 288", font: .body7, textColor: .naverMapGray7, alignment: .center, bgColor: UIColor.naverMapReview5, borderColor: UIColor.naverMapReview4, borderWidth: 1, radius: 3)
        blogReview.setupRoundedLabel(text: "블로그리뷰 316", font: .body7, textColor: .naverMapGray7, alignment: .center, bgColor: UIColor.naverMapReview5, borderColor: UIColor.naverMapReview4, borderWidth: 1, radius: 3)
        
        /// 리뷰 이미지
        imgGroup.setupStackView(bgColor: .naverMapWhite, axis: .horizontal, distribution: .fillEqually, spacing: 4)
        img1.setupImageView(image: ImageLiterals.img_beating_heart, maskedCorners: [.layerMinXMinYCorner, .layerMinXMaxYCorner] , radius: 6, borderColor: UIColor.naverMapGray1, width: 1)
        img2.setupImageView(image: ImageLiterals.img_beating_heart, radius: 0, borderColor: UIColor.naverMapGray1, width: 1)
        img3.setupImageView(image: ImageLiterals.img_beating_heart, maskedCorners: [.layerMaxXMinYCorner, .layerMaxXMaxYCorner] , radius: 6, borderColor: UIColor.naverMapGray1, width: 1)
        
        ///구분선
        divider.do{
            $0.backgroundColor = .naverMapBlack5
        }
        
        ///하단 바텀뷰
        bottomIconGroup.setupStackView(bgColor: .naverMapWhite, axis: .horizontal, distribution: .fillEqually, spacing: 20)
        reservation.setImage(ImageLiterals.ic_navercal, for: .normal)
        contact.setImage(ImageLiterals.ic_call_thick, for: .normal)
        favorites.setImage(ImageLiterals.ic_star_thick, for: .normal)
        share.setImage(ImageLiterals.ic_share, for: .normal)
        btnGroup.setupStackView(bgColor: .naverMapWhite, axis: .horizontal, distribution: .fillEqually, spacing: 6)
        departure.setupRoundedLabel(text: "출발", font: .body7, textColor: .naverMapBlue, alignment: .center, bgColor: .naverMapWhite, borderColor: .naverMapBlue, borderWidth: 1, radius: 16)
        departure.attributedText = NSAttributedString(string: departure.text!, attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        arrival.setupRoundedLabel(text: "도착", font: .body7, textColor: .naverMapWhite, alignment: .center, bgColor: .naverMapBlue, borderColor: .naverMapWhite, borderWidth: 1, radius: 16)
        arrival.attributedText = NSAttributedString(string: arrival.text!, attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
    }
    
    ///상세 위치 정보 버튼 이벤트
    ///버튼 클릭 시 상세 위치 정보 뷰가 나타남
    @objc
    func showDetailLocation(_gesture: UIGestureRecognizer) {
        hidden = !hidden
        detailLocationView.isHidden = hidden
    }
    
    ///바텀시트 탭 시 상세 뷰로 전환하는 이벤트
    @objc
    func showDetailView(sender: UITapGestureRecognizer) {
        let detailVC = DetailViewController()
        detailVC.modalPresentationStyle = .fullScreen
        self.present(detailVC, animated: true)
        print("move to detail")
    }
}

