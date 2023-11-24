import UIKit

import MapKit
import SnapKit
import Then

class SearchResultViewController: UIViewController {
    
    // MARK: UI Properties
    
    private var topBarView = UIView()
    private var topStackView = UIStackView()
    private var backBtn = UIButton()
    private var searchTextfield = UITextField()
    private var micBtn = UIButton()
    private var exitBtn = UIButton()
    private var mapView = MKMapView()
    private var mapBtnStackView = UIStackView()
    private var menuBtn = UIButton()
    private var favoritesBtn = UIButton()
    private var roadViewBtn = UIButton()
    private var locationBtn = UIButton()
    private var bottomSheetView = UIView()
    private var stackView = UIStackView()
    private var dragIcon = UIView()
    private var topIconGroup = UIView()
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
    private var departure = UIButton()
    private var arrival = UIButton()
    
    // MARK: Properties
   
    private let defaultLocation = CLLocationCoordinate2D(latitude: 37.548241, longitude: 127.072978)
    private let defaultSpanValue = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupStyle()
    }

    // MARK: - Layout
    
    func setupLayout(){
        self.view.addSubviews([topBarView, mapView, bottomSheetView])
        topBarView.addSubview(topStackView)
        topStackView.addArrangedSubviews(backBtn, searchTextfield, exitBtn)
        mapView.addSubviews([mapBtnStackView, locationBtn])
        mapBtnStackView.addArrangedSubviews(menuBtn, favoritesBtn, roadViewBtn)
        searchTextfield.addSubviews([micBtn])
        bottomSheetView.addSubviews([dragIcon, stackView, divider, bottomView])
        stackView.addArrangedSubviews(topIconGroup, resultTitleGroup, detail, locationInfoGroup, resultInfoGroup, reviewGroup, imgGroup)
        topIconGroup.addSubviews([pay, booking, order])
        resultTitleGroup.addSubviews([name, category])
        locationInfoGroup.addSubviews([distance, dot, location, dropBtn])
        resultInfoGroup.addSubviews([status, lastOrder])
        
        ///상단 서치뷰
        topBarView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(103)
        }
        topStackView.snp.makeConstraints{
            $0.top.equalTo(topBarView).inset(45)
            $0.leading.trailing.equalTo(topBarView).inset(16)
            $0.bottom.equalToSuperview()
        }
        backBtn.snp.makeConstraints{
            $0.width.equalTo(24)
        }
        searchTextfield.snp.makeConstraints{
            $0.leading.equalTo(backBtn.snp.trailing).offset(9)
            $0.trailing.equalTo(exitBtn.snp.leading).offset(-9)
            $0.top.bottom.equalTo(topStackView).inset(9)
        }
        exitBtn.snp.makeConstraints{
            $0.width.equalTo(24)
        }
        micBtn.snp.makeConstraints{
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview().inset(12)
            $0.width.height.equalTo(24)
        }
        
        ///중앙 지도뷰
        mapView.snp.makeConstraints{
            $0.top.equalTo(topBarView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(400)
        }
        mapBtnStackView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(41)
            $0.height.equalTo(135)
        }
        locationBtn.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.bottom.equalTo(bottomSheetView.snp.top).offset(-16)
            $0.width.height.equalTo(41)
        }
        
        ///하단 바텀시트뷰
        bottomSheetView.snp.makeConstraints{
            $0.leading.bottom.trailing.equalToSuperview()
            $0.height.equalTo(bottomSheetView.getDeviceHeight()/7 * 3)
        }
        dragIcon.snp.makeConstraints{
            $0.top.equalTo(bottomSheetView).inset(14)
            $0.width.equalTo(34)
            $0.height.equalTo(4.3)
            $0.centerX.equalToSuperview()
        }
        stackView.snp.makeConstraints{
            $0.top.equalTo(dragIcon.snp.bottom).offset(14)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(stackView.getDeviceHeight() / 3)
        }
        ///상단 네이버 아이콘 그룹
        topIconGroup.snp.makeConstraints{
            $0.height.equalTo(13)
        }
        pay.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.height.equalTo(13)
        }
        booking.snp.makeConstraints{
            $0.leading.equalTo(pay.snp.trailing).offset(8)
            $0.height.equalTo(13)
        }
        order.snp.makeConstraints{
            $0.leading.equalTo(booking.snp.trailing).offset(8)
            $0.height.equalTo(13)
        }
        ///검색 결과 이름 & 카테고리
        resultTitleGroup.snp.makeConstraints{
            $0.height.equalTo(20)
        }
        name.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.height.equalTo(20)
            $0.bottom.equalToSuperview()
        }
        category.snp.makeConstraints{
            $0.leading.equalTo(name.snp.trailing).offset(4)
            $0.height.equalTo(18)
            $0.bottom.equalToSuperview()
        }
        ///검색 결과 이름 & 카테고리
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
        
        
        divider.snp.makeConstraints{
            $0.top.equalTo(stackView.snp.bottom)
            $0.height.equalTo(1)
            $0.leading.trailing.equalToSuperview()
        }
        bottomView.snp.makeConstraints{
            $0.top.equalTo(divider.snp.bottom)
            $0.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    // MARK: - Style
    
    func setupStyle(){
        self.view.backgroundColor = .naverMapWhite
        ///상단 서치뷰
        topBarView.do{
            $0.backgroundColor = .naverMapWhite
            $0.layer.shadowColor = UIColor.naverMapBlack10.cgColor
            $0.layer.shadowOpacity = 1
            $0.layer.shadowRadius = 4
            $0.layer.shadowOffset = CGSize(width: 0, height: 3)
            $0.layer.borderColor = UIColor.naverMapGray4.cgColor
            $0.layer.borderWidth = 1
        }
        topStackView.do{
            $0.axis = .horizontal
            $0.backgroundColor = .white
            $0.distribution = .equalSpacing
        }
        backBtn.setImage(ImageLiterals.ic_arrow_left_g6, for: .normal)
        searchTextfield.do{
            $0.addPadding(left: 12, right: 12)
            $0.font = .title4
            $0.textColor = .naverMapBlack
            $0.makeRounded(radius: 10)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.naverMapGray2.cgColor
            $0.backgroundColor = .naverMapWhite
            $0.addPadding(left: 12, right: 12)
        }
        micBtn.setImage(ImageLiterals.ic_mic, for: .normal)
        exitBtn.setImage(ImageLiterals.ic_remove, for: .normal)
        
        ///맵뷰
        mapView.do{
            $0.setRegion(MKCoordinateRegion(center: defaultLocation, span: defaultSpanValue), animated: true)
        }
        mapBtnStackView.do{
            $0.axis = .vertical
            $0.backgroundColor = .clear
            $0.distribution = .fillEqually
            $0.spacing = 7
        }
        menuBtn.setImage(ImageLiterals.ic_copy, for: .normal)
        favoritesBtn.setImage(ImageLiterals.ic_star_fill, for: .normal)
        roadViewBtn.setImage(ImageLiterals.ic_location_remove, for: .normal)
        locationBtn.setImage(ImageLiterals.ic_current_location, for: .normal)
        locationBtn.backgroundColor = .blue
        for i in [menuBtn, favoritesBtn, roadViewBtn, locationBtn] {
            i.layer.cornerRadius = 20
            i.backgroundColor = .naverMapWhite
            i.layer.shadowColor = UIColor.naverMapGray2.cgColor
            i.layer.shadowOpacity = 1
            i.layer.shadowRadius = 2
            i.layer.shadowOffset = CGSize(width: 0, height: 4)
            i.layer.borderColor = UIColor.naverMapGray3.cgColor
            i.layer.borderWidth = 0.5
        }
        
        ///하단 바텀시트뷰
        bottomSheetView.do{
            $0.makeRounded(radius: 20, maskedCorners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
            $0.backgroundColor = .naverMapWhite
        }
        dragIcon.do{
            $0.layer.cornerRadius = 2
            $0.backgroundColor = .naverMapBlueGray4
        }
        stackView.do{
            $0.backgroundColor = .naverMapGray1
            $0.axis = .vertical
            $0.distribution = .fillProportionally
            $0.spacing = 13
        }
        ///하단 바텀시트뷰
        ///상단 네이버 아이콘 그룹
        topIconGroup.do{
            $0.backgroundColor = .blue
        }
        pay.setImage(ImageLiterals.caption_naverpay, for: .normal)
        booking.setImage(ImageLiterals.caption_naverbooking, for: .normal)
        order.setImage(ImageLiterals.caption_naverorder, for: .normal)
        ///하단 바텀시트뷰
        ///검색결과 이름 & 카테고리
        resultTitleGroup.do{
            $0.backgroundColor = .yellow
        }
        name.do{
            $0.text = "알고"
            $0.font = .title2
            $0.textColor = .naverMapSubBlue
        }
        category.do{
            $0.text = "스파게티, 파스타전문"
            $0.font = .body10
            $0.textColor = .naverMapGray4
        }
        ///하단 바텀시트뷰
        ///검색 결과 이름 & 카테고리
        detail.do{
            $0.text = "수제맥주를 즐길 수 있는 어린이대공원 파스타 맛집"
            $0.font = .body7
            $0.textColor = .naverMapGray6
            $0.backgroundColor = .systemPink
        }
        ///검색 결과 위치정보
        locationInfoGroup.do{
            $0.backgroundColor = .purple
        }
        distance.do{
            $0.text = "936m"
            $0.font = .body3
            $0.textColor = .naverMapGray6
        }
        dot.do{
            $0.layer.cornerRadius = 1
            $0.backgroundColor = .naverMapGray3
        }
        location.do{
            $0.text = "서울 광진구"
            $0.font = .bodyButton
            $0.textColor = .naverMapGray6
        }
        dropBtn.do{
            $0.setImage(ImageLiterals.ic_arrow_down, for: .normal)
        }
        ///검색 결과 영업 정보
        resultInfoGroup.do{
            $0.backgroundColor = .green
        }
        status.do{
            $0.text = "영업 중"
            $0.font = .body6
            $0.textColor = .naverMapNaverGreen
        }
        lastOrder.do{
            $0.text = "22:00에 라스트오더"
            $0.font = .body7
            $0.textColor = .naverMapGray7
        }
        
        imgGroup.do{
            $0.backgroundColor = .orange
        }
        divider.do{
            $0.backgroundColor = .naverMapBlack5
        }
        bottomView.do{
            $0.backgroundColor = .gray
        }
    }
    
    func showMyViewControllerInACustomizedSheet() {
        let detailVC = DetailViewController()
        if let sheet = detailVC.sheetPresentationController {
            sheet.detents = [.medium(), .large()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(detailVC, animated: true, completion: nil)
    }
}

