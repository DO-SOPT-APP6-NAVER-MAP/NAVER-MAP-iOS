//
//  ColorLiterals.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

extension UIColor {
    
    // MARK: - Black Gray White
    
    static var naverMapBlack: UIColor {
        return UIColor(hex: "#000000")
    }
    
    static var naverMapGray8: UIColor {
        return UIColor(hex: "#3B3B3B")
    }
    
    static var naverMapGray7: UIColor {
        return UIColor(hex: "#484848")
    }
    
    static var naverMapGray6: UIColor {
        return UIColor(hex: "#555555")
    }
    
    static var naverMapGray5: UIColor {
        return UIColor(hex: "#828282")
    }
    
    static var naverMapGray4: UIColor {
        return UIColor(hex: "#A4A4A4")
    }
    
    static var naverMapGray3: UIColor {
        return UIColor(hex: "#CCCCCC")
    }
    
    static var naverMapGray2: UIColor {
        return UIColor(hex: "#DADADA")
    }
    
    static var naverMapGray1: UIColor {
        return UIColor(hex: "#F1F1F1")
    }
    
    static var naverMapWhite: UIColor {
        return UIColor(hex: "#FFFFFF")
    }
    
    // MARK: - BlueGray
    
    static var naverMapBlueGray6: UIColor {
        return UIColor(hex: "#3C3F45")
    }
    
    static var naverMapBlueGray5: UIColor {
        return UIColor(hex: "#757F8B")
    }
    
    static var naverMapBlueGray4: UIColor {
        return UIColor(hex: "#C9D1DC")
    }
    
    static var naverMapBlueGray3: UIColor {
        return UIColor(hex: "#E6EAF0")
    }
    
    static var naverMapBlueGray2: UIColor {
        return UIColor(hex: "#F0F0F3")
    }
    
    static var naverMapBlueGray1: UIColor {
        return UIColor(hex: "#F9F9FB")
    }
    
    // MARK: - Sub Color
    
    static var naverMapSubBlue: UIColor {
        return UIColor(hex: "#0D65B3")
    }
    
    static var naverMapSubGreen: UIColor {
        return UIColor(hex: "#49A34B")
    }
    
    static var naverMapSubKhaki: UIColor {
        return UIColor(hex: "#595E22")
    }
    
    // MARK: - Color
    
    static var naverMapBlue: UIColor {
        return UIColor(hex: "#0385FF")
    }
    
    static var naverMapOrange: UIColor {
        return UIColor(hex: "#F56652")
    }
    
    static var naverMapRed: UIColor {
        return UIColor(hex: "#F61024")
    }
    
    static var naverMapGreen: UIColor {
        return UIColor(hex: "#66C056")
    }
    
    static var naverMapNaverGreen: UIColor {
        return UIColor(hex: "#03C75Ai")
    }
    
    static var naverMapKhaki: UIColor {
        return UIColor(hex: "#6A7128")
    }
    
    // MARK: - Review
    
    static var naverMapReview1: UIColor {
        return UIColor(hex: "#1DA4B2")
    }
    
    static var naverMapReview2: UIColor {
        return UIColor(hex: "#A1E0D8")
    }
    
    static var naverMapReview3: UIColor {
        return UIColor(hex: "#C5E9E6")
    }
    
    static var naverMapReview4: UIColor {
        return UIColor(hex: "#9EDBB9")
    }
    
    static var naverMapReview5: UIColor {
        return UIColor(hex: "#E7FFF1")
    }
    
    // MARK: - Alpha
    
    static var naverMapBlack80: UIColor {
        return UIColor(hex: "#000000").withAlphaComponent(0.8)
    }

    static var naverMapBlack20: UIColor {
        return UIColor(hex: "#000000").withAlphaComponent(0.2)
    }
    
    static var naverMapBlack10: UIColor {
        return UIColor(hex: "#000000").withAlphaComponent(0.1)
    }
    
    static var naverMapBlack5: UIColor {
        return UIColor(hex: "#000000").withAlphaComponent(0.05)
    }
    
    static var naverMapGray60: UIColor {
        return UIColor(hex: "#B9C0C9").withAlphaComponent(0.6)
    }
}

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        assert(hexFormatted.count == 6, "Invalid hex code used.")
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0, alpha: alpha)
    }
}
