//
//  LocationModel.swift
//  NAVER-MAP-iOS
//
//  Created by 윤영서 on 11/29/23.
//

import UIKit

struct LocationModel {
    // TODO:- API 연결 시 String으로 변환
    let imageURL1, imageURL2, imageURL3, imageURL4, imageURL5: UIImage?
    let name, category, description, stars, visitorReview, blogReview, detailAddress, direction, closeTime, number, characters, sns, detail: String
}

extension LocationModel {
    static let locationModel: [LocationModel] = [
        LocationModel(imageURL1: UIImage(named: "img_top_big"),
                      imageURL2: UIImage(named: "img_top_big"),
                      imageURL3: UIImage(named: "img_top_big"),
                      imageURL4: UIImage(named: "img_top_big"),
                      imageURL5: UIImage(named: "img_top_big"),
                      name: "알리바바",
                      category: "스파게티, 파스타 전문",
                      description: "수제맥주를 즐길 수 있는 어린이대공원 파스타 맛집",
                      stars: "4.82",
                      visitorReview: "288",
                      blogReview: "316",
                      detailAddress: "서울 광진구 광나루로17길 10 2층",
                      direction: "어린이대공원역 5번 출구에서 187m",
                      closeTime: "22:00",
                      number: "02-3409-2645",
                      characters: "무선 인터넷, 주차, 포장, 배달, 반려동물 동반, 예약",
                      sns: "https://www.instagram.com/algo_taphouse",
                      detail: "안녕하세요 부담없는 가격과 맛있는 맛으로 여러분께 다가가는 파스타 및 맥주 전문점 알고입니다. 편안한 한 끼 식사, 편안한 한 잔의 맥주로 여러분의 하루를 특별하게 만들어드립니다.")
    ]
}
