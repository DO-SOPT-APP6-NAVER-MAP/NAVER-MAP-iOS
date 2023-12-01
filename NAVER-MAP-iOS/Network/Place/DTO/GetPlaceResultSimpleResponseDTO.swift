//
//  GetPlaceResultSimpleResponseDTO.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/29/23.
//

import Foundation


struct GetPlaceResultSimpleResponseDTO: Codable {
    let statusCode: Int
    let message: String
    let data: GetPlaceResultSimpleResponseData
}

struct GetPlaceResultSimpleResponseData: Codable {
    let name: String
    let category: String
    let description: String
    let distance: String
    let address: String
    let rodeNameAddress: String
    let localAddress: String
    let closeTime: String
    let stars: String
    let visitorReview: Int
    let blogReview: Int
    let previewImgs: [PreviewImg]
}

struct PreviewImg: Codable {
    let previewId: Int
    let previewImgUrl: String
}
