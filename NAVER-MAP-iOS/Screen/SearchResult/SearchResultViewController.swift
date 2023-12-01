import UIKit

import CoreLocation
import FloatingPanel
import MapKit
import Moya
import NMapsGeometry
import NMapsMap
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
    private var mapView = NMFNaverMapView()
    private var mapBtnStackView = UIStackView()
    private var menuBtn = UIButton()
    private var favoritesBtn = UIButton()
    private var roadViewBtn = UIButton()
    private var locationBtn = UIButton()
    private var bottomSheetPanel = FloatingPanelController()
    let marker = NMFMarker()

    // MARK: Properties
   
    private let defaultLocation = CLLocationCoordinate2D(latitude: 37.548241, longitude: 127.072978)
    private let defaultSpanValue = MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001)
    private var placeId: Int
    private var locationManager = CLLocationManager()
    
    // MARK: - Initializer
    
    init(forPlaceId: Int) {
        self.placeId = forPlaceId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupLayout()
        setupStyle()
        setBottomSheetPanel()
    }

    // MARK: - View
    
    func setupView(){
        self.view.addSubviews([topBarView, mapView, bottomSheetPanel.view])
        topBarView.addSubview(topStackView)
        topStackView.addArrangedSubviews(backBtn, searchTextfield, exitBtn)
        mapView.addSubviews([mapBtnStackView, locationBtn])
        mapBtnStackView.addArrangedSubviews(menuBtn, favoritesBtn, roadViewBtn)
        searchTextfield.addSubviews([micBtn])
    }
    
    // MARK: - Layout
    
    func setupLayout(){
        
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
            $0.height.equalTo(self.view.convertByHeightRatio(400))
        }
        mapBtnStackView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview().inset(17)
            $0.width.equalTo(41)
            $0.height.equalTo(135)
        }
        locationBtn.snp.makeConstraints{
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalTo(self.view).inset(self.view.convertByHeightRatio(358))
            $0.width.height.equalTo(41)
        }
        bottomSheetPanel.view.snp.makeConstraints{
            $0.leading.bottom.trailing.equalToSuperview()
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
        topStackView.setupStackView(bgColor: .naverMapWhite, axis: .horizontal, distribution: .equalSpacing)
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
        mapBtnStackView.setupStackView(bgColor: .clear, axis: .vertical, distribution: .fillEqually, spacing: 7)
        menuBtn.setImage(ImageLiterals.ic_copy, for: .normal)
        favoritesBtn.setImage(ImageLiterals.ic_star_fill, for: .normal)
        roadViewBtn.setImage(ImageLiterals.ic_location_remove, for: .normal)
        locationBtn.setImage(ImageLiterals.ic_current_location, for: .normal)

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
    }
    
    // MARK: - 맵뷰 세팅
    func setMap(x: Double, y: Double, name: String) {
        mapView.do{
            $0.showLocationButton = false
            $0.showZoomControls = false
            $0.mapView.zoomLevel = 16
        }
        setLocationData(x: x, y: y, name: name)
    }
    
    // MARK: - 내 위치의 위도, 경도 세팅
    func setLocationData(x: Double, y: Double, name: String) {
        // locationManager 설정
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()

        if CLLocationManager.locationServicesEnabled() == true {
            print("위치 서비스 On 상태")
            locationManager.startUpdatingLocation()

            //현 위치로 카메라 이동
            let cameraUpdate = NMFCameraUpdate(scrollTo: NMGLatLng(lat: y , lng: x ))
            cameraUpdate.animation = .easeIn
            mapView.mapView.moveCamera(cameraUpdate)

            setMarker(x: x, y: y, name: name)
        } else {
            print("위치 서비스 Off 상태")
        }
    }
    
    //MARK: - 마커 세팅
    func setMarker(x: Double, y: Double, name: String) {
        marker.captionRequestedWidth = 60             // 캡션 너비
        marker.position = NMGLatLng(lat: y, lng: x) // 마커 위치
        marker.width = 43
        marker.height = 59
        marker.captionText = name
        marker.captionColor = .naverMapBlack
        marker.captionTextSize = 12
        marker.captionAligns = [NMFAlignType.bottom]

        let image = ImageLiterals.ic_select_location
        marker.iconImage = NMFOverlayImage(image: image)
        marker.mapView = self.mapView.mapView

        print("setMarker\(self.marker.captionText)")

    }
    
    // TODO: 바텀시트컨트롤러 추후 수정
    
    func setBottomSheetPanel() {
        let detailLocationVC = DetailLocationViewController(forPlaceId: self.placeId)
//        detailLocationVC.placeId = self.placeId
        bottomSheetPanel.do{
            $0.delegate = self
            $0.set(contentViewController: detailLocationVC)
            // detailLocationVC를 관리하는 UIViewController
            $0.addPanel(toParent: self)
            $0.layout = MyFloatingPanelLayout()
            $0.invalidateLayout()
            // panel 스타일 변경 (대신 bar UI가 사라지므로 따로 넣어주어야함)
            $0.changePanelStyle()
            $0.isModalInPresentation = true
        }
        getLocationData(location: detailLocationVC.detailLocationView.roadNameLabel.text!, name: detailLocationVC.name.text!)
    }
}

extension SearchResultViewController: FloatingPanelControllerDelegate {
    func floatingPanelDidChangeState(_ fpc: FloatingPanelController) {
        if fpc.state == .full {
            let detailVC = DetailViewController(forPlaceId: self.placeId)
            self.navigationController?.pushViewController(detailVC, animated: false)
        }
    }
}

private extension SearchResultViewController {
    
    private func getLocationData(location: String, name: String) {
        let moyaProvider = MoyaProvider<GetLocationService>()
        moyaProvider.request(.getLocation(body: GetLocationQuery(location: location))) {
            result in switch result {
            case .success(let response):
                guard let locationData = try? response.map(GetLocationDTO.self) else {return}
                DispatchQueue.main.async {
                    self.setMap(x: Double(locationData.addresses[0].x)!, y: Double(locationData.addresses[0].y)!, name: name)
                    print("location data \(locationData)")
                }
            case .failure(let error):
                print(error.localizedDescription)
                print("location data \(error.localizedDescription)")
            }
        }
    }
}
