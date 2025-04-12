//
//  AssetListViewModel.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 11/4/25.
//

import Foundation

@Observable
final class AssetListViewModel {
    var errorMessage: String?
    var assets: [Asset] = []
    
    func fetchAssets() async {
        let urlSession = URLSession.shared
        
        guard let url = URL(string: "https://rest.coincap.io/v3/assets?apiKey=0e46f6021931e3999ce3675a3548da6eb0a895d3328a5c3cbdcc17e846dafc42") else {
            errorMessage = "Invalid URL"
            return
        }
        
        //let urlRequest = URLRequest(url: url)
        
        do {
            let (data, _) = try await urlSession.data(for: URLRequest(url: url))
            let assetsResponse = try JSONDecoder().decode(AssetsResponse.self, from: data)
            self.assets = assetsResponse.data
            //print(assets)
        } catch {
            print(error.localizedDescription)
            errorMessage = error.localizedDescription
        }
        
    }
    
}
