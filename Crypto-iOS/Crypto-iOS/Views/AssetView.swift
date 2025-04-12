//
//  AssetView.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 11/4/25.
//
import SwiftUI

struct AssetViewState {
    let asset: Asset
    
    init(_ asset: Asset) {
        self.asset = asset
    }
    
    var percentageColor: Color {
        percentage >= 0 ? .green : .red
    }
    
    var percentage: Double {
        Double(asset.changePercent24Hr) ?? 0
    }
    
    var formattedPrice: String {
        String(format: "%.2f", Double(asset.priceUsd) ?? 0)
    }
    
    var formattedPercentage: String {
        String(format: "%.2f", Double(asset.changePercent24Hr) ?? 0)
    }
    
    var iconUrl: URL? {
        URL(string:
                "https://assets.coincap.io/assets/icons/\(asset.symbol.lowercased())@2x.png")
    }
}

struct AssetView:  View {
    
    //let asset: Asset
    let assetViewState: AssetViewState
    
    var body: some View {
        Grid {
            GridRow {
                AsyncImage(
                    url: assetViewState.iconUrl) { image in
                        image
                            .resizable()
                    } placeholder: {
                        Image(systemName: "dollarsign.gauge.chart.lefhalf.righthalf")
                    }
                    .frame(width: 40, height: 40)
                
                
                VStack(alignment: .leading) {
                    Text(assetViewState.asset.symbol)
                        .font(.headline)
                    Text(assetViewState.asset.name)
                        .font(.headline)
                        .foregroundStyle(.gray)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                }
                
                Spacer()
                
                Text(assetViewState.formattedPercentage)
                    //.foregroundStyle(asset.percentage >= 0 ? .green : .red)
                    .foregroundStyle(assetViewState.percentageColor)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text(assetViewState.formattedPrice)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        
        
//        HStack {
//            AsyncImage(
//                url: asset.iconUrl) { image in
//                    image
//                        .resizable()
//                } placeholder: {
//                    Image(systemName: "dollarsign.gauge.chart.lefhalf.righthalf")
//                }
//                .frame(width: 40, height: 40)
//            
//            
//            VStack(alignment: .leading) {
//                Text(asset.symbol)
//                    .font(.headline)
//                Text(asset.name)
//                    .font(.headline)
//                    .foregroundStyle(.gray)
//                
//            }
//            
//            Spacer()
//            
//            Text(asset.formattedPercentage)
//                .foregroundStyle(asset.percentage >= 0 ? .green : .red)
//            
//            Text(asset.formattedPrice)
//        }
//        .padding(.horizontal)
    }
}

#Preview {
    AssetView(
        assetViewState: .init(
            .init(
                id: "bitcoin",
                name: "Bitcoin",
                symbol: "BTC",
                priceUsd: "8700.876875765765765765",
                changePercent24Hr: "8.7857658758768"
            )
        )        
    )
}

