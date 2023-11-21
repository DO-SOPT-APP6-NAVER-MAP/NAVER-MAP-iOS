import UIKit
import SnapKit
import Then
import MapKit

class SearchResultViewController: UIViewController {
    // MARK: UI Properties
    private var topBarView = UIView()
    private var topStackView = UIStackView()
    private var backBtn = UIButton()
    private var searchTextfield = UITextField()
    private var micBtn = UIButton()
    private var exitBtn = UIButton()
    private var mapView = MKMapView()
    
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
        searchTextfield.addSubviews([micBtn])

        topBarView.snp.makeConstraints{
            $0.top.leading.trailing.equalToSuperview()
            $0.width.equalTo(375)
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
        
    }
    
    // MARK: - Style
    func setupStyle(){
        self.view.backgroundColor = .white
        topBarView.do{
            $0.backgroundColor = .white
            $0.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor
            $0.layer.shadowOpacity = 1
            $0.layer.shadowRadius = 4
            $0.layer.shadowOffset = CGSize(width: 0, height: 3)
            $0.layer.borderColor = UIColor(red: 0.643, green: 0.643, blue: 0.643, alpha: 1).cgColor
            $0.layer.borderWidth = 1
        }
        topStackView.do{
            $0.axis = .horizontal
            $0.backgroundColor = .white
            $0.distribution = .equalSpacing
        }
        
        backBtn.setImage(UIImage(named: "icons=ic_arrow_left_g6"), for: .normal)
        searchTextfield.do{
            $0.addPadding(left: 12, right: 12)
            $0.font = .title4
            $0.textColor = .black
            $0.makeRounded(radius: 10)
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor(hex: "#DADADA").cgColor
            $0.backgroundColor = .white
            $0.addPadding(left: 12, right: 12)
        }
        micBtn.setImage(UIImage(named: "icons=ic_mic"), for: .normal)
        exitBtn.setImage(UIImage(named: "icons=ic_remove"), for: .normal)
        
        mapView.do{
            $0.setRegion(MKCoordinateRegion(center: defaultLocation, span: defaultSpanValue), animated: true)
        }
    }
}

