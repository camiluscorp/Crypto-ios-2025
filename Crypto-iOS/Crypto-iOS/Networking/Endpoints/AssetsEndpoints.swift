//
//  AssetsEndpoints.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 26/4/25.
//
import Foundation

enum AssetsEndpoints {
    case fetchAll
    case fetch(String)
    case history(String)
}

extension AssetsEndpoints: Endpoint {
    
    var path: String {
        let apiKey = "" //poner apikey valido
        
        switch self {
        case .fetchAll:
            return "assets?apiKey=\(apiKey)"
        case .fetch(let id):
            return "assets/\(id)?apiKey=\(apiKey)"
        case .history(let id):
            return "assets/\(id)/history?apiKey=\(apiKey)&interval=h1"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .fetchAll, .fetch, .history:
            return .get
        }
    }
    
    var header: [String : String]? {
        return nil
    }
    
    var body: [String : String]? {
        return nil
    }
}
