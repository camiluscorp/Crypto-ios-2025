//
//  AssetsListViewModelsTest.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 12/4/25.
//

import Testing
import Dependencies

@testable import Crypto_iOS

var assetStub: Asset = .init (
    id:"bitcoin",
    name:"Bitcoin",
    symbol: "BTC",
    priceUsd:"12.1232131",
    changePercent24Hr: "9.3443"
)

extension AssetsApiClient {
    static var mockWithFailure: AssetsApiClient {
        .init(fetchAllAssets: {
            throw NetworkingError.invalidURL
        })
    }
    
    static var mockWithSuccess: AssetsApiClient {
        .init(fetchAllAssets: {
           [assetStub]
        })
    }
}

struct AssetListViewModelsTest {
    
    @Test func clientConfigured() {
        let viewModel = AssetListViewModel()
            
        viewModel.configClient()
            
        #expect(viewModel.clientConfigured == true)
    }
    
    @Test func fetcAssetsFailure() async throws {
        let viewModel = withDependencies {
            $0.assetsApiClient = .mockWithFailure
        } operation: {
            AssetListViewModel()
        }
        
        await viewModel.fetchAssets()
        
        #expect(viewModel.errorMessage == "Invalid URL")
    }
    
    @Test func fetcAssetsSuccess() async throws {
        let viewModel = withDependencies {
            $0.assetsApiClient = .mockWithSuccess
        } operation: {
            AssetListViewModel()
        }
        
        await viewModel.fetchAssets()
        
        #expect(viewModel.assets.count == 1)
        #expect(viewModel.assets == [ assetStub ])
    }
    
}
