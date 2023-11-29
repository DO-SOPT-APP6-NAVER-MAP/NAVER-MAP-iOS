//
//  GetPlaceSearchResponseDTO.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/29/23.
//

import Foundation

struct GetPlaceSearchResponseDTO: Codable {
    let statusCode: Int
    let message: String
    let data: [GetPlaceSearchResponseData]
}

struct GetPlaceSearchResponseData: Codable{
    let placeId: Int
    let name: String
    let category: String
    let detailAddress: String
    let distance: String
    let visitorReview: Int
}
