import UIKit

import SnapKit
import Then

class DetailLocationView: UIView {
    
    // MARK: UIProperties
    
    private var stackView = UIStackView()
    private var container1 = UIView()
    private var roadNameTitle = UILabel()
    private var roadName = UILabel()
    private var copyBtn1 = UIButton()
    private var container2 = UIView()
    private var localNumTitle = UILabel()
    private var localNumName = UILabel()
    private var copyBtn2 = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setView()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Set View

    private func setView() {
        self.addSubview(stackView)
        stackView.addArrangedSubviews(container1, container2)
        container1.addSubviews([roadNameTitle, roadName, copyBtn1])
        container2.addSubviews([localNumTitle, localNumName, copyBtn2])
    }
    
    // MARK: Set Layout

    private func setLayout() {
        self.snp.makeConstraints{
            $0.height.equalTo(self.convertByHeightRatio(60))
        }
        stackView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(stackView.convertByHeightRatio(6))
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview()
        }
        for i in [container1, container2]{
            i.snp.makeConstraints{
                $0.height.equalTo(stackView.convertByHeightRatio(24))
                $0.leading.trailing.equalToSuperview()
            }
        }
        for i in [roadNameTitle, localNumTitle] {
            i.snp.makeConstraints{
                $0.centerY.equalToSuperview()
                $0.height.equalTo(i.convertByHeightRatio(16))
                $0.leading.equalToSuperview()
            }
        }
        ///도로명 주소 정보
        roadNameTitle.snp.makeConstraints{
            $0.width.equalTo(roadNameTitle.convertByWidthRatio(36))
        }
        roadName.snp.makeConstraints{
            $0.leading.equalTo(roadNameTitle.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
        }
        copyBtn1.snp.makeConstraints{
            $0.leading.equalTo(roadName.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
        }
        ///지번 주소 정보
        localNumTitle.snp.makeConstraints{
            $0.width.equalTo(localNumTitle.convertByWidthRatio(25))
        }
        localNumName.snp.makeConstraints{
            $0.leading.equalTo(localNumTitle.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
        }
        copyBtn2.snp.makeConstraints{
            $0.leading.equalTo(localNumName.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
        }
    }
    
    // MARK: Set Style

    private func setStyle() {
        self.do{
            $0.backgroundColor = .naverMapWhite
            $0.layer.cornerRadius = 5
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.naverMapBlueGray4.cgColor
            $0.layer.masksToBounds = true
        }
        stackView.setupStackView(bgColor: .naverMapWhite, axis: .vertical, distribution: .fillEqually)
        for i in [container1, container2] {
            i.backgroundColor = .naverMapWhite
        }
        for i in [copyBtn1, copyBtn2] {
            i.setImage(ImageLiterals.ic_copy_1, for: .normal)
        }
        
        ///도로명 주소 정보
        roadNameTitle.setupRoundedLabel(text: "도로명", font: .buttonCaption3, textColor: .naverMapGray4, alignment: .center, bgColor: .naverMapWhite, borderColor: .naverMapGray2, borderWidth: 1, radius: 1)
        roadName.setupLabel(font: .body9, text: "광나루로17길 10 2층", textColor: .naverMapGray6)
        
        /// 지번 주소 정보
        localNumTitle.setupRoundedLabel(text: "지번", font: .buttonCaption3, textColor: .naverMapGray4, alignment: .center, bgColor: .naverMapWhite, borderColor: .naverMapGray2, borderWidth: 1, radius: 1)
        localNumName.setupLabel(font: .body9, text: "군자동 373-8 2층", textColor: .naverMapGray6)
    }
}
