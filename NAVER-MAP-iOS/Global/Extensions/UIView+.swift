//
//  UIView+.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

extension UIView {
    
    /// 한 번에 여러 개의 UIView 또는 UIView의 하위 클래스 객체들을 상위 UIView에 추가
    @discardableResult
    func addSubviews<T: UIView>(_ subviews: [T], then closure: (([T]) -> Void)? = nil) -> [T] {
        subviews.forEach {
            addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        closure?(subviews)
        return subviews
    }
    
    /// UIView 의 모서리가 둥근 정도를 설정
    /// - Parameter radius: radius 값
    /// - Parameter maskedCorners: radius를 적용할 코너 지정
    func makeRounded(radius: CGFloat? = nil, maskedCorners: CACornerMask? = nil) {
        if let corners = maskedCorners {
            self.layer.maskedCorners = corners
        }
        
        if let cornerRadius = radius {
            self.layer.cornerRadius = cornerRadius
        }  else {
            self.layer.cornerRadius = self.layer.frame.height / 2
        }
        
        self.layer.masksToBounds = true
    }
    
    // MARK: - 기기 대응
    
    func getDeviceWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    func getDeviceHeight() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /// 아이폰 13 미니(width 375)를 기준으로 레이아웃을 잡고, 기기의 width 사이즈를 곱해 대응 값을 구할 때 사용
    func convertByWidthRatio(_ convert: CGFloat) -> CGFloat {
        return convert * (getDeviceWidth() / 375)
    }
    
    /// 아이폰 13 미니(height 812)를 기준으로 레이아웃을 잡고, 기기의 height 사이즈를 곱해 대응 값을 구할 때 사용
    func convertByHeightRatio(_ convert: CGFloat) -> CGFloat {
        return convert * (getDeviceHeight() / 812)
    }
    
    /// 아이폰 13 미니(width 375)를 기준으로 레이아웃을 잡고, 기기의 width 사이즈를 곱해 대응 값을 구할 때 사용
    func convertByReverseWidthRatio(_ convert: CGFloat) -> CGFloat {
        return convert * (375 / getDeviceWidth())
    }
    
    /// 아이폰 13 미니(height 812)를 기준으로 레이아웃을 잡고, 기기의 height 사이즈를 곱해 대응 값을 구할 때 사용
    func convertByReverseHeightRatio(_ convert: CGFloat) -> CGFloat {
        return convert * (812 / getDeviceHeight())
    }
    
    /// 노치가 있는지 없는지 Bool 값 반환
    var hasNotch: Bool {
        return !( (UIScreen.main.bounds.width / UIScreen.main.bounds.height) > 0.5 )
    }
}
