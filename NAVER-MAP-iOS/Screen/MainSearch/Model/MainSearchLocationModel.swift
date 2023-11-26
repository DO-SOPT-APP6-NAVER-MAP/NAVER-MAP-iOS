//
//  MainSearchLocationModel.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/25/23.
//

import Foundation

struct MainSearchLocationModel {
    let locationName: String
    let location: String
    let reviewCount: Int?
    let category: String
    let distance: String
}

// TODO: - 더미 데이터 삭제 예정

extension MainSearchLocationModel {
    static func fetchDummyData() -> [MainSearchLocationModel] {
        return [MainSearchLocationModel(locationName: "알고",
                                        location: "서울 광진구 광나루17일 10 2층",
                                        reviewCount: 288,
                                        category: "스파게티, 파스타전문",
                                        distance: "935m"),
                MainSearchLocationModel(locationName: "알고리즘",
                                        location: "서울 강남구 도산대로49길 8 2층",
                                        reviewCount: 12,
                                        category: "퓨전음식",
                                        distance: "31km"),
                MainSearchLocationModel(locationName: "알고",
                                        location: "서울 강남구 테헤란로87길 21 동성빌딩...",
                                        reviewCount: 1,
                                        category: "경영컨설팅",
                                        distance: "3.6km"),
                MainSearchLocationModel(locationName: "알고리고",
                                        location: "서울 강남구 봉은사로 319 내외빌딩 4층",
                                        reviewCount: 1,
                                        category: "소프트웨어개발",
                                        distance: "4.3km"),
                MainSearchLocationModel(locationName: "알고랩",
                                        location: "서울 강남구 봉은사로 331 9층",
                                        reviewCount: nil,
                                        category: "퀵서비스",
                                        distance: "4.2km"),
                MainSearchLocationModel(locationName: "알고파토이",
                                        location: "서울 강동구 천호대로151길 19 2층",
                                        reviewCount: 466,
                                        category: "장난감",
                                        distance: "4.4km"),
                MainSearchLocationModel(locationName: "알고리마",
                                        location: "서울 강남구 영동대로 342 3층",
                                        reviewCount: nil,
                                        category: "기업",
                                        distance: "3.9km"),
                MainSearchLocationModel(locationName: "알고케어",
                                        location: "서울 중구 마른내로 47 6층",
                                        reviewCount: nil,
                                        category: "소프트웨어개발",
                                        distance: "7.5km")]
    }
}
