//
//  PlaceAPIService.swift
//  NAVER-MAP-iOS
//
//  Created by 김다예 on 11/29/23.
//

import Foundation

import Moya

protocol PlaceAPIServiceProtocol {
    func getPlaceSearch(forPlaceName: String,
                        completion: @escaping (NetworkResult<GetPlaceSearchResponseDTO>) -> ())
    func getPlaceResultSimple(forPlaceId: Int,
                              completion: @escaping (NetworkResult<GetPlaceResultSimpleResponseDTO>) -> ())
    func getPlaceResultDetail(forPlaceId: Int,
                              completion: @escaping (NetworkResult<GetPlaceResultDetailResponseDTO>) -> ())
    func getPlaceRoute(forPlaceId: Int,
                       completion: @escaping (NetworkResult<GetPlaceRouteResponseDTO>) -> ())
}


final class PlaceAPIService: BaseService, PlaceAPIServiceProtocol {
    
    let provider = MoyaProvider<PlaceAPI>(plugins: [MoyaPlugin()])
    
    func getPlaceSearch(forPlaceName: String, completion: @escaping (NetworkResult<GetPlaceSearchResponseDTO>) -> ()) {
        provider.request(.getPlaceSearch(forPlaceName: forPlaceName)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<GetPlaceSearchResponseDTO> = self.fetchNetworkResult(
                    statusCode: response.statusCode,
                    data: response.data
                )
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getPlaceResultSimple(forPlaceId: Int, completion: @escaping (NetworkResult<GetPlaceResultSimpleResponseDTO>) -> ()) {
        provider.request(.getPlaceResultSimple(forPlaceId: forPlaceId)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<GetPlaceResultSimpleResponseDTO> = self.fetchNetworkResult(
                    statusCode: response.statusCode,
                    data: response.data
                )
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getPlaceResultDetail(forPlaceId: Int, completion: @escaping (NetworkResult<GetPlaceResultDetailResponseDTO>) -> ()) {
        provider.request(.getPlaceResultDetail(forPlaceId: forPlaceId)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<GetPlaceResultDetailResponseDTO> = self.fetchNetworkResult(
                    statusCode: response.statusCode,
                    data: response.data
                )
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    func getPlaceRoute(forPlaceId: Int, completion: @escaping (NetworkResult<GetPlaceRouteResponseDTO>) -> ()) {
        provider.request(.getPlaceRoute(forPlaceId: forPlaceId)) { result in
            switch result {
            case .success(let response):
                let networkResult: NetworkResult<GetPlaceRouteResponseDTO> = self.fetchNetworkResult(
                    statusCode: response.statusCode,
                    data: response.data
                )
                completion(networkResult)
            case .failure(let err):
                print(err)
            }
        }
    }
    
    
}
