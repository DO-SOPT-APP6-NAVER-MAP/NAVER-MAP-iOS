//
//  BaseTargetType.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/29/23.
//

import Foundation

import Moya

protocol BaseTargetType: TargetType { 
    var utilPath: String { get }
}

// 공통된 속성 정의
extension BaseTargetType {
    
    var baseURL: URL {
        guard let urlString = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.baseURL) as? String,
              let url = URL(string: urlString) else {
            fatalError("🚨Base URL을 찾을 수 없습니다🚨")
        }
        return url
    }
    
    var method: Moya.Method {
        return .get
    }
        
    var headers: [String: String]? {
        let header = [
            "Content-Type": "application/json"
        ]
        return header
    }
    
    var sampleData: Data {
        return Data()
    }
}
