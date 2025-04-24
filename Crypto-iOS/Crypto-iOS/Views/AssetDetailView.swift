//
//  AssetDetailView.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 12/4/25.
//

import SwiftUI

struct AssetDetailView: View {
    //let asset: Asset
    @State var viewModel: AssetDetailsViewModel
    
    var body: some View {
        VStack {
            //Text(asset.name)
            Text(viewModel.asset.name)
            
            Button {
                viewModel.addToFavourites()
            } label: {
                Text ("Add to favourites")
            }
        }
        //.navigationTitle(asset.name)
        .navigationTitle(viewModel.asset.name)
        .alert(
            viewModel.errorMessage ?? "",
            isPresented: $viewModel.showError) {
                Button("OK"){
                    
                }
            }
        
    }
}

#Preview {
    NavigationStack {
        AssetDetailView(
            viewModel: .init (
                asset: .init(
                    id: "bitcoin",
                    name: "Bitcoin",
                    symbol: "BTC",
                    priceUsd: "8700.876875765765765765",
                    changePercent24Hr: "8.7857658758768"
                )
            )
        )
    }
    
}
