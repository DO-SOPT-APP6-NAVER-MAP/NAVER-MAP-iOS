//
//  FontLiterals.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

extension UIFont {
        
    // MARK: - Title
    
    class var title1: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 30)
    }
    
    class var title2: UIFont {
        return UIFont.font(.pretendardSemiBold, ofSize: 20)
    }
    
    class var title3: UIFont {
        return UIFont.font(.pretendardSemiBold, ofSize: 18)
    }
    
    class var title4: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 18)
    }
    
    // MARK: - Body
    
    class var body1: UIFont {
        return UIFont.font(.pretendardMedium, ofSize: 17)
    }
    
    class var body2: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 17)
    }
    
    class var body3: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 16)
    }
    
    class var body4: UIFont {
        return UIFont.font(.pretendardMedium, ofSize: 16)
    }
    
    class var body5: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 16)
    }
    
    class var body6: UIFont {
        return UIFont.font(.pretendardSemiBold, ofSize: 15)
    }
    
    class var bodyButton: UIFont {
        return UIFont.font(.pretendardMedium, ofSize: 15)
    }
    
    class var body7: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 15)
    }
    
    class var body8: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 14)
    }
    
    class var body9: UIFont {
        return UIFont.font(.pretendardMedium, ofSize: 14)
    }
    
    class var body10: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 14)
    }
    
    class var body11: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 13)
    }
    
    class var body12: UIFont {
        return UIFont.font(.pretendardMedium, ofSize: 13)
    }
    
    // MARK: - Button/Caption
    
    class var buttonCaption1: UIFont {
        return UIFont.font(.pretendardBold, ofSize: 12)
    }
    
    class var buttonCaption2: UIFont {
        return UIFont.font(.pretendardSemiBold, ofSize: 12)
    }
    
    class var buttonCaption3: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 12)
    }
    
    class var button1: UIFont {
        return UIFont.font(.pretendardSemiBold, ofSize: 10)
    }
    
    class var button2: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 10)
    }
    
    class var button3: UIFont {
        return UIFont.font(.pretendardRegular, ofSize: 8)
    }
}

enum FontName: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardMedium = "Pretendard-Medium"
    case pretendardRegular = "Pretendard-Regular"
}

extension UIFont {
    static func font(_ style: FontName, ofSize size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
