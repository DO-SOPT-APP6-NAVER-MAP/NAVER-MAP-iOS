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
        self.view.addSubviews([topBarView, mapView])
        topBarView.addSubview(topStackView)
        topStackView.addArrangedSubviews(backBtn, searchTextfield, exitBtn)
        mapView.addSubviews([mapBtnStackView, locationBtn])
        mapBtnStackView.addArrangedSubviews(menuBtn, favoritesBtn, roadViewBtn)
        searchTextfield.addSubviews([micBtn])

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
            $0.leading.bottom.equalToSuperview().inset(16)
            $0.width.height.equalTo(41)
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
            $0.textColor = UIColor.naverMapBlack
            $0.makeRounded(radius: 10)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.naverMapGray2.cgColor
            $0.backgroundColor = UIColor.naverMapWhite
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
    }
}

