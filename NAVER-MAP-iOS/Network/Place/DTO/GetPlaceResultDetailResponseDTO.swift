//
//  GetPlaceResultDetailResponseDTO.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/29/23.
//

import Foundation

struct GetPlaceResultDetailResponseDTO: Codable {
    let statusCode: Int
    let message: String
    let data: GetPlaceResultDetailResponseData
}

struct GetPlaceResultDetailResponseData: Codable {
    let name: String
    let category: String
    let description: String
    let stars: String
    let visitorReview: Int
    let blogReview: Int
    let detailAddress: String
    let direction: String
    let closeTime: String
    let number: String
    let characters: String
    let sns: String
    let detail: String
    let menuInfos: [MenuInfo]
    let visitorReviewInfos: [ReviewInfo]
    let blogReviewInfos: [ReviewInfo]
}

struct ReviewInfo: Codable {
    let visitorReviewId: Int
    let visitorReviewAuthor: String
    let visitorReviewTitle: String?
    let visitorReviewContent: String
    let visitorReviewAuthorThumbnail: String
    let visitorReviewImgUrl: String
}

struct MenuInfo: Codable {
    let menuId: Int
    let menuName: String
    let menuPrice: Int
    let menuImgUrl: String
}
