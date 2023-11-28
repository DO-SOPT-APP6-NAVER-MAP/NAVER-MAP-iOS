//
//  DetailBlogData.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/27/23.
//

import UIKit

struct DetailBlogData {
    let profileImg, reviewImg: UIImage?
    let userName, userDescription, createdAt, reviewTitle, reviewContent, imgCnt: String
}

extension DetailBlogData {
    static let detailBlogData: [DetailBlogData] = [
        DetailBlogData(profileImg: ImageLiterals.ic_car, 
                       reviewImg: UIImage(named: "img_top_big"),
                       userName: "또치288",
                       userDescription: "별을 담은 당신께 드려요",
                       createdAt: "10.25.수", 
                       reviewTitle: "[어린이대공원/세종대] 파스타 맛집 '알고' → 후식은 '와플칸' 조져!!",
                       reviewContent: "월요일이었다. 왜 살아야 하나 이유가 필요했던 하루. 이런 기분이 들 땐, 효과 좋은 와플칸",
                       imgCnt: "2"),
        DetailBlogData(profileImg: ImageLiterals.ic_car,
                       reviewImg: UIImage(named: "img_top_big"),
                       userName: "또치288",
                       userDescription: "별을 담은 당신께 드려요",
                       createdAt: "10.25.수",
                       reviewTitle: "[어린이대공원/세종대] 파스타 맛집 '알고' → 후식은 '와플칸' 조져!!",
                       reviewContent: "월요일이었다. 왜 살아야 하나 이유가 필요했던 하루. 이런 기분이 들 땐, 효과 좋은 와플칸",
                       imgCnt: "2"),
        DetailBlogData(profileImg: ImageLiterals.ic_car,
                       reviewImg: UIImage(named: "img_top_big"),
                       userName: "또치288",
                       userDescription: "별을 담은 당신께 드려요",
                       createdAt: "10.25.수",
                       reviewTitle: "[어린이대공원/세종대] 파스타 맛집 '알고' → 후식은 '와플칸' 조져!!",
                       reviewContent: "월요일이었다. 왜 살아야 하나 이유가 필요했던 하루. 이런 기분이 들 땐, 효과 좋은 와플칸",
                       imgCnt: "2")
    ]
}
    
