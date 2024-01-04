import UIKit

final class DetailLocationViewModel {
    
    //MARK: - Property
    
    private var searchNetworkData = GetPlaceResultSimpleResponseData(name: "", category: "", description: "", distance: "", address: "", rodeNameAddress: "", localAddress: "", closeTime: "", stars: "", visitorReview: -1, blogReview: -1, previewImgs: [])
    
    //MARK: - LifeCycle

    init() {
        fetchNetworkResult()
    }
}

extension DetailLocationViewModel {
    
    func fetchResultData() -> GetPlaceResultSimpleResponseData {
        return searchNetworkData
    }
}

// MARK: private extenstion

private extension DetailLocationViewModel {
    
    // MARK: -서버 통신 함수

    func fetchNetworkResult() {
        NetworkService.shared.placeService.getPlaceResultSimple(forPlaceId: 1) {
            result in
            switch result {
            case .success(let response):
                if let responseData = response?.data {
                    self.searchNetworkData = responseData
                }
            default: break
            }
        }
    }
}
