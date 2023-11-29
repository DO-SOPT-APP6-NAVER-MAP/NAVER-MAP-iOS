//
//  NetworkResult.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/29/23.
//

import Foundation

enum NetworkResult<T> {
    case success(T?)                 // 서버 통신 성공했을 때 (200)
    case requestErr                  // 존재하지 않는 요청 (404)
    case serverErr                   // 서버 에러 (500)
    
    case networkFail                // 네트워크 연결 실패했을 때
    case decodeErr                  // 데이터는 받아왔으나 DTO 형식으로 decode가 되지 않을 때
    
    var errorDescription: String {
        switch self {
        case .requestErr: return "🚨존재하지 않는 요청🚨"
        case .serverErr: return "🚨서버 내부 에러(지만 확인해보자)🚨"
        case .networkFail: return "🚨네트워크 에러🚨"
        case .decodeErr: return "🚨디코딩 실패🚨"
        default: return "200이면 성공"
        }
    }
}
