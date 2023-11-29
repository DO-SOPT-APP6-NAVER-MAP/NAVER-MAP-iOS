//
//  PlaceAPI.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/29/23.
//

import Foundation

import Moya

enum PlaceAPI {
    case getPlaceSearch(forPlaceName: String)
    case getPlaceResultSimple(forPlaceId: Int)
    case getPlaceResultDetail(forPlaceId: Int)
    case getPlaceRoute(forPlaceId: Int)
}

// BaseTargetType에서 정의한 공통된 속성 이외에 API마다 다른 값을 각각 지정해줌
extension PlaceAPI: BaseTargetType {
    
    var utilPath: String {
        return "api/place"
    }
    
    var path: String {
        switch self {
        case .getPlaceSearch(_):
            return utilPath
        case .getPlaceResultSimple(let forPlaceId):
            return utilPath + "/\(forPlaceId)"
        case .getPlaceResultDetail(let forPlaceId):
            return utilPath + "/\(forPlaceId)/detail"
        case .getPlaceRoute(let forPlaceId):
            return utilPath + "/\(forPlaceId)/route"
        }
    }
    
    var parameter: [String : Any]? {
        switch self {
        case .getPlaceSearch(let forPlaceName):
            return ["name" : forPlaceName]
        default:
            return .none
        }
    }
    
    var task: Task {
        if let parameter = parameter {
            return .requestParameters(parameters: parameter, encoding: URLEncoding.default)
        } else {
            return .requestPlain
        }
    }
}
