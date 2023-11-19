//
//  UIStackView+.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

extension UIStackView {
    
    /// 한 번에 여러 개의 UIView 또는 UIView의 하위 클래스 객체들을 상위 UIStackView에 추가
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func removeAllArrangedSubviews() {
        self.arrangedSubviews.forEach {
            self.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}
