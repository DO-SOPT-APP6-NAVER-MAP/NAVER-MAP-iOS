//
//  FindingRouteModel.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/28/23.
//

import Foundation

struct FindingRouteModel {
    let imageURL: String
}

extension FindingRouteModel {
    static let dummyData: [FindingRouteModel] =
    [FindingRouteModel(imageURL:"https://sopt-seminar.s3.ap-northeast-2.amazonaws.com/direction/result_first.png"),
     FindingRouteModel(imageURL: "https://sopt-seminar.s3.ap-northeast-2.amazonaws.com/direction/reult_second.png"),
     FindingRouteModel(imageURL: "https://sopt-seminar.s3.ap-northeast-2.amazonaws.com/direction/result_last.png")]
    
}
