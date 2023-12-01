import Foundation

import Moya

struct GetLocationQuery: Codable {
    let location: String
}

enum GetLocationService {
    case getLocation(body: GetLocationQuery)
}

extension GetLocationService: TargetType {
    var baseURL: URL {
        guard let urlString = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.naverURL) as? String,
              let url = URL(string: urlString) else {
            fatalError("🚨NAVER-MAP URL을 찾을 수 없습니다🚨")
        }
        return url
    }
    
    var path: String {
        switch self {
        case .getLocation: return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getLocation: return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Moya.Task {
        switch self{
        case .getLocation(let body):
            return .requestParameters(parameters: ["query": body.location], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        let clientId = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.clientId) as? String ?? ""
        let apiKey = Bundle.main.object(forInfoDictionaryKey: Config.Keys.Plist.apiKey) as? String ?? ""
        return ["Content-type": "application/json", "X-NCP-APIGW-API-KEY-ID": clientId, "X-NCP-APIGW-API-KEY": apiKey]
    }
}
