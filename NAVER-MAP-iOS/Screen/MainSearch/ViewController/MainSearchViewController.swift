//
//  MainSearchViewController.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/20/23.
//

import UIKit

final class MainSearchViewController: UIViewController {
    
    private let rootView = MainSearchRootView()

    override func loadView() {
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNavigationBar()
    }
}
