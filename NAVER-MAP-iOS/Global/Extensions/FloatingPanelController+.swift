import UIKit

import FloatingPanel

extension FloatingPanelController {
    func changePanelStyle() {
        let appearance = SurfaceAppearance()
        let shadow = SurfaceAppearance.Shadow()
        shadow.color = UIColor.naverMapBlack5
        shadow.offset = CGSize(width: 0, height: -4)
        shadow.opacity = 1
        shadow.radius = 10
        appearance.shadows = [shadow]
        appearance.cornerRadius = 10
        appearance.backgroundColor = .naverMapWhite
        appearance.borderColor = .naverMapGray1
        appearance.borderWidth = 1
        
        surfaceView.grabberHandle.isHidden = true
        surfaceView.appearance = appearance
    }
    
    func calculate() {
        print("location : \(surfaceLocation)")
        print("location : \(UIScreen.main.bounds.height / 812 * 399)")
    }
}
