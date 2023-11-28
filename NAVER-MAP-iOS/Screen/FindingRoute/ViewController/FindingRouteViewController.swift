//
//  FindingRouteViewController.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

class FindingRouteViewController: UIViewController {

    // MARK: - UI Properties

    private let rootView = FindingRouteRootView()

    // MARK: - Life Cycle

    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNavigationBar()
    }
}
