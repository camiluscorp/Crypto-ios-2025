//
//  FavouritesView.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 24/4/25.
//
import SwiftUI

struct FavouritesView: View {
    @State var viewModel: FavouritesViewModel = .init()

    var body: some View {
        List {
                    ForEach(viewModel.assets) { asset in
                        AssetView(
                            assetViewState: .init(asset)
                        )
                        
                    }
                }
                .listStyle(.plain)
                .task {
                    await viewModel.getFavourites()
                }
        
//        List {
//            ForEach(viewModel.favourites, id: \.self) { favourite in
//                Text(favourite)
//                
//            }
//        }
//        .listStyle(.plain)
//        .task {
//            await viewModel.getFavourites()
//        }
    }
}

#Preview {
    FavouritesView()
}


//https://firebase.google.com/docs/firestore/query-data/get-data?hl=es-419
