//
//  GetPlaceRouteResponseDTO.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/29/23.
//

import Foundation

struct GetPlaceRouteResponseDTO: Codable {
    let statusCode: Int
    let message: String
    let data: GetPlaceRouteResponseData
}

struct GetPlaceRouteResponseData: Codable {
    let directionLists: [DirectionList]
}

struct DirectionList: Codable {
    let directionId: Int
    let route: String
}
