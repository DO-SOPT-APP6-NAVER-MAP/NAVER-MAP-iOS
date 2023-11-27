//
//  DetailAppData.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/24/23.
//

import UIKit

struct DetailMenuData {
    let menuImage: UIImage?
    let menuName, menuPrice, menuOrderCnt: String
}

extension DetailMenuData {
    static let detailMenuDummy: [DetailMenuData] = [
        DetailMenuData(menuImage: UIImage(named: "img_top_big"),
              menuName: "투움바 파스타",
              menuPrice: "10,900",
              menuOrderCnt: "2"),
        DetailMenuData(menuImage: UIImage(named: "img_top_big"),
              menuName: "김치 베이컨 필라프",
              menuPrice: "11,900",
              menuOrderCnt: "2"),
        DetailMenuData(menuImage: UIImage(named: "img_top_big"),
              menuName: "샐러드",
              menuPrice: "13,900",
              menuOrderCnt: "2"),
        DetailMenuData(menuImage: UIImage(named: "img_top_small_1"),
              menuName: "내가 만든 쿠키",
              menuPrice: "10,900",
              menuOrderCnt: "2342")]
}
