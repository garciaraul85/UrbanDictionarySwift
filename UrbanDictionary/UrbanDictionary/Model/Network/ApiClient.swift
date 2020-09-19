//
//  Service.swift
//  UrbanDictionary
//
//  Created by Saulo Garcia on 9/19/20.
//

import Foundation
import RxRetroSwift
import RxSwift
import RxCocoa

fileprivate extension Encodable {
    var dictionaryValue:[String: Any?]? {
        guard let data = try? JSONEncoder().encode(self),
              let dictionary = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            return nil
        }
        return dictionary
    }
}

class APIClient {
    
    static var shared = APIClient()
    
    lazy var caller:RequestCaller = {
        let config = URLSessionConfiguration.default
        config.httpAdditionalHeaders = ["Accept":"application/json", "Request-Type":"iOS", "Content-Type":"application/json", "x-rapidapi-host": "mashape-community-urban-dictionary.p.rapidapi.com", "x-rapidapi-key": "fa4696258dmsh1466b9aca472b68p153f4ejsn11926702be6f"]
        if #available(iOS 11.0, *) {
            config.waitsForConnectivity = true
        }
        return RequestCaller(config: config)
    }()
    
    private init() {
        RequestModel.defaults.baseUrl = "https://mashape-community-urban-dictionary.p.rapidapi.com"
    }
    
    func fetchTerm(term: String) throws -> Observable<Result<UrbanResponse, ErrorModel>> {
        let request = RequestModel(
            httpMethod: .get,
            path: "define",
            query: ["term" : term])
            .asURLRequest()
        return caller.call(request)
    }
    
}
