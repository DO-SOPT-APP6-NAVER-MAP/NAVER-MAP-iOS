import UIKit

extension UIImageView {
    
    ///이미지뷰 세팅 함수
    func setupImageView(image: UIImage, maskedCorners: CACornerMask? = nil, radius: CGFloat? = nil, borderColor: UIColor, width: CGFloat) {
        self.image = image
        if let corners = maskedCorners {
            self.layer.maskedCorners = corners
        }
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius ?? 0
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = width
    }
}
