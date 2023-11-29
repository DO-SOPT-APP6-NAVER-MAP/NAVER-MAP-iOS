//
//  BaseService.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/29/23.
//

import Foundation

class BaseService {
    
    /// 200 받았을 때 decoding 할 데이터가 있는 경우 (대부분의 GET)
    func fetchNetworkResult<T: Decodable>(statusCode: Int, data: Data) -> NetworkResult<T> {
        switch statusCode {
        case 200:
            if let decodedData = fetchDecodeData(data: data, responseType: T.self) {
                return .success(decodedData)
            } else {
                print(NetworkResult<Any>.decodeErr.errorDescription)
                return .decodeErr
            }
        case 404:
            print(NetworkResult<Any>.requestErr.errorDescription)
            return .requestErr
        case 500: 
            print(NetworkResult<Any>.serverErr.errorDescription)
            return .serverErr
        default: 
            print(NetworkResult<Any>.networkFail.errorDescription)
            return .networkFail
        }
    }
    
    func fetchDecodeData<T: Decodable>(data: Data, responseType: T.Type) -> T? {
        let decoder = JSONDecoder()
        if let decodedData = try? decoder.decode(responseType, from: data){
            return decodedData
        } else { return nil }
    }
}
