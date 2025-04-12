//
//  AssetDetailView.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 12/4/25.
//

import SwiftUI

struct AssetDetailView: View {
    let asset: Asset
    
    var body: some View {
        Text(asset.name)
            .navigationTitle(asset.name)
    }
}

#Preview {
    NavigationStack {
        AssetDetailView (
            asset: .init(
                id: "bitcoin",
                name: "Bitcoin",
                symbol: "BTC",
                priceUsd: "8700.876875765765765765",
                changePercent24Hr: "8.7857658758768"
            )
        )
    }
    
}
