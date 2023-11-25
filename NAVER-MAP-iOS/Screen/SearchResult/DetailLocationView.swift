import UIKit

import SnapKit
import Then

class DetailLocationView: UIView {
    
    // MARK: UIProperties
    
    private var entireStackView = UIStackView()
    private var containerView1 = UIView()
    private var roadNameTitleLabel = UILabel()
    private var roadNameLabel = UILabel()
    private var copyBtn1 = UIButton()
    private var containerView2 = UIView()
    private var localNumTitleLabel = UILabel()
    private var localNumNameLabel = UILabel()
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
        self.addSubview(entireStackView)
        entireStackView.addArrangedSubviews(containerView1, containerView2)
        containerView1.addSubviews([roadNameTitleLabel, roadNameLabel, copyBtn1])
        containerView2.addSubviews([localNumTitleLabel, localNumNameLabel, copyBtn2])
    }
    
    // MARK: Set Layout

    private func setLayout() {
        self.snp.makeConstraints{
            $0.height.equalTo(self.convertByHeightRatio(60))
        }
        entireStackView.snp.makeConstraints{
            $0.top.bottom.equalToSuperview().inset(entireStackView.convertByHeightRatio(6))
            $0.leading.equalToSuperview().inset(12)
            $0.trailing.equalToSuperview()
        }
        for i in [containerView1, containerView2]{
            i.snp.makeConstraints{
                $0.height.equalTo(entireStackView.convertByHeightRatio(24))
                $0.leading.trailing.equalToSuperview()
            }
        }
        for i in [roadNameTitleLabel, localNumTitleLabel] {
            i.snp.makeConstraints{
                $0.centerY.equalToSuperview()
                $0.height.equalTo(i.convertByHeightRatio(16))
                $0.leading.equalToSuperview()
            }
        }
        ///도로명 주소 정보
        roadNameTitleLabel.snp.makeConstraints{
            $0.width.equalTo(roadNameTitleLabel.convertByWidthRatio(36))
        }
        roadNameLabel.snp.makeConstraints{
            $0.leading.equalTo(roadNameTitleLabel.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
        }
        copyBtn1.snp.makeConstraints{
            $0.leading.equalTo(roadNameLabel.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
        }
        ///지번 주소 정보
        localNumTitleLabel.snp.makeConstraints{
            $0.width.equalTo(localNumTitleLabel.convertByWidthRatio(25))
        }
        localNumNameLabel.snp.makeConstraints{
            $0.leading.equalTo(localNumTitleLabel.snp.trailing).offset(4)
            $0.centerY.equalToSuperview()
        }
        copyBtn2.snp.makeConstraints{
            $0.leading.equalTo(localNumNameLabel.snp.trailing).offset(4)
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
        entireStackView.setupStackView(bgColor: .naverMapWhite, axis: .vertical, distribution: .fillEqually)
        for i in [containerView1, containerView2] {
            i.backgroundColor = .naverMapWhite
        }
        for i in [copyBtn1, copyBtn2] {
            i.setImage(ImageLiterals.ic_copy_1, for: .normal)
        }
        
        ///도로명 주소 정보
        roadNameTitleLabel.setupRoundedLabel(text: "도로명", font: .buttonCaption3, textColor: .naverMapGray4, alignment: .center, bgColor: .naverMapWhite, borderColor: .naverMapGray2, borderWidth: 1, radius: 1)
        roadNameLabel.setupLabel(font: .body9, text: "광나루로17길 10 2층", textColor: .naverMapGray6)
        
        /// 지번 주소 정보
        localNumTitleLabel.setupRoundedLabel(text: "지번", font: .buttonCaption3, textColor: .naverMapGray4, alignment: .center, bgColor: .naverMapWhite, borderColor: .naverMapGray2, borderWidth: 1, radius: 1)
        localNumNameLabel.setupLabel(font: .body9, text: "군자동 373-8 2층", textColor: .naverMapGray6)
    }
}
