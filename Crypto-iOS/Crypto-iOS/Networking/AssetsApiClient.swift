//
//  AssetsApiClient.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 12/4/25.
//
import Dependencies
import Foundation
import XCTestDynamicOverlay

struct AssetsApiClient {
    var fetchAllAssets: () async throws -> [Asset]
    
}

enum NetworkingError: Error {
    case invalidURL
    
    var localizedDescription: String {
        switch self {
        case.invalidURL:
            return "Invalid URL"
        }
    }
}

extension AssetsApiClient: DependencyKey {
    static var liveValue: AssetsApiClient {
        .init(
            fetchAllAssets: {
                let urlSession = URLSession.shared
                
                guard let url = URL(string: "https://a27c2c52-aa18-451d-8b25-24fc7448c9f7.mock.pstmn.io/v3/assets") else {
                    throw NetworkingError.invalidURL
                }
                
                let (data, _) = try await urlSession.data(for: URLRequest(url: url))
                let assetsResponse = try JSONDecoder().decode(AssetsResponse.self, from: data)
                return assetsResponse.data
                
            }
        )
    }
    
//    static var previewValue: AssetsApiClient {
//        .init (
//            fetchAllAssets: {[
//                .init (
//                    id:"bitcoin",
//                    name:"Bitcoin",
//                    symbol: "BTC",
//                    priceUsd:"12.1232131",
//                    changePercent24Hr: "9.3443"
//                ),
//                .init (
//                    id:"ethereum",
//                    name:"Ethereum",
//                    symbol: "ETH",
//                    priceUsd:"17.1232131",
//                    changePercent24Hr: "91.3443"
//                ),
//                .init (
//                    id:"tether",
//                    name:"tether",
//                    symbol: "USDT",
//                    priceUsd:"2.1232131",
//                    changePercent24Hr: "-19.3443"
//                )
//            ]}
//        )
//    }
    
    static var testValue: AssetsApiClient {
            .init(fetchAllAssets: {
                XCTFail("AssetsApiClient.fetchAllAssets is unimplemented")
    //            reportIssue("AssetsApiClient.fetchAllAssets is unimplemented")
                return []
            })
    }
}

extension DependencyValues {
    var assetsApiClient: AssetsApiClient {
        get{ self [AssetsApiClient.self] }
        set{ self [AssetsApiClient.self] = newValue }
    }
}
