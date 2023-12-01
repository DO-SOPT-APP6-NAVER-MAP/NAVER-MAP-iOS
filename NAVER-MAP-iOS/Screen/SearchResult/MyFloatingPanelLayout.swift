import UIKit

import FloatingPanel

class MyFloatingPanelLayout: FloatingPanelLayout {

    var position: FloatingPanelPosition {
        return .bottom
    }

    var initialState: FloatingPanelState {
        return .tip
    }

    // 가능한 floating panel: 현재 full, half만 가능하게 설정
    var anchors: [FloatingPanelState: FloatingPanelLayoutAnchoring] {
        return [
            .full: FloatingPanelLayoutAnchor(absoluteInset: UIScreen.main.bounds.height / 812 * 58, edge: .top, referenceGuide: .superview),
            .half: FloatingPanelLayoutAnchor(absoluteInset: UIScreen.main.bounds.height / 812 * 399, edge: .bottom, referenceGuide: .superview),
            .tip: FloatingPanelLayoutAnchor(absoluteInset: UIScreen.main.bounds.height / 812 * 390, edge: .bottom, referenceGuide: .superview)
        ]
    }
}
