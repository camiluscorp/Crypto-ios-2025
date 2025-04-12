//
//  AssetView.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 11/4/25.
//
import SwiftUI

struct AssetView:  View {
    
    let asset: Asset
    
    var body: some View {
        HStack {
            AsyncImage(
                url: asset.iconUrl) { image in
                    image
                        .resizable()
                } placeholder: {
                    Image(systemName: "dollarsign.gauge.chart.lefhalf.righthalf")
                }
                .frame(width: 40, height: 40)
            
            
            VStack(alignment: .leading) {
                Text(asset.symbol)
                    .font(.headline)
                Text(asset.name)
                    .font(.headline)
                    .foregroundStyle(.gray)
                
            }
            
            Spacer()
            
            Text(asset.formattedPercentage)
                .foregroundStyle(asset.percentage >= 0 ? .green : .red)
            
            Text(asset.formattedPrice)
        }
        .padding(.horizontal)
    }
}

#Preview {
    AssetView(
        asset: .init(
            id: "bitcoin",
            name: "Bitcoin",
            symbol: "BTC",
            priceUsd: "8700.876875765765765765",
            changePercent24Hr: "8.7857658758768"

        )
    )
}

