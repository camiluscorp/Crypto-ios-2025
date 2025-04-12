//
//  AssetListViewModel.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 11/4/25.
//

import Foundation
import Dependencies

@Observable
final class AssetListViewModel {
    var errorMessage: String?
    var assets: [Asset] = []
    
    @ObservationIgnored
    @Dependency(\.assetsApiClient) var apiClient
    
    var clientConfigured = false
        
    func configClient() {
        clientConfigured = true
    }
    
    func fetchAssets() async {
        do {
            assets = try await apiClient.fetchAllAssets()
            
        } catch let error as NetworkingError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    
//    func fetchAssets() async {
//        let urlSession = URLSession.shared
//        
//        guard let url = URL(string: "https://a27c2c52-aa18-451d-8b25-24fc7448c9f7.mock.pstmn.io/v3/assets") else {
//            errorMessage = "Invalid URL"
//            return
//        }
//        
//        //let urlRequest = URLRequest(url: url)
//        
//        do {
//            let (data, _) = try await urlSession.data(for: URLRequest(url: url))
//            let assetsResponse = try JSONDecoder().decode(AssetsResponse.self, from: data)
//            self.assets = assetsResponse.data
//            //print(assets)
//        } catch {
//            print(error.localizedDescription)
//            errorMessage = error.localizedDescription
//        }
//        
//    }
    
}
