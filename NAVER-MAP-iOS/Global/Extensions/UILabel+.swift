//
//  UILabel+.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

extension UILabel {
    
    /// 특정 text의 색상을 바꿔주는 함수
    /// > 사용 예시 : label.highlightText(forText: "안녕", forColor: .FoDongOrange)
    func highlightText(forText: String, forColor: UIColor) {
        guard let labelText = self.text else { return }
        let attributedString = NSMutableAttributedString(string: labelText)
        
        let range = (labelText as NSString).range(of: forText)
        attributedString.addAttribute(.foregroundColor, value: forColor, range: range)
        
        self.attributedText = attributedString
    }
    
    /// 특정 text에 underline을 추가하는 함수
    /// > 사용 예시 : label.underLineText(forText: ["맛집을 추천"])
    func underLineText(forText: [String]) {
        guard let labelText = self.text else { return }
        
        let underLineText = NSMutableAttributedString(string: labelText)
        
        for text in forText {
            let range = (labelText as NSString).range(of: text)
            underLineText.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
        }
        
        self.attributedText = underLineText
    }
    
    /// UILabel에 Image를 같이 사용하고 싶을 때 사용하는 함수
    func labelWithImg(composition: NSAttributedString...) {
        let attributedString = NSMutableAttributedString()
        for i in composition {
            attributedString.append(i)
            attributedString.append(NSAttributedString(string: " "))
        }
        self.attributedText = attributedString
    }
    
    /// UILabel 기본 세팅  => 폰트, 텍스트, 텍스트색상, 정렬방법(옵션)
    func setupLabel(font: UIFont, text: String, textColor: UIColor, alignment: NSTextAlignment? = nil) {
        self.font = font
        self.text = text
        self.textColor = textColor
        self.textAlignment = alignment ?? .center
    }
    
    ///둥근 테두리의 라벨 세팅 함수
    func setupRoundedLabel(text: String, font: UIFont, textColor: UIColor, alignment: NSTextAlignment, bgColor: UIColor, borderColor: UIColor, borderWidth: CGFloat, radius: CGFloat) {
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = alignment
        self.backgroundColor = bgColor
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}
