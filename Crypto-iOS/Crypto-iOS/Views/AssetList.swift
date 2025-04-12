//
//  AssetList.swift
//  Crypto-iOS
//
//  Created by Flavio Quisiguiña on 11/4/25.
//

import SwiftUI

struct AssetList: View {
    @State var viewModel: AssetListViewModel = .init()
    
    var body: some View {
        NavigationStack {
            Text(viewModel.errorMessage ?? "")
            List {
                ForEach(viewModel.assets, id: \.id) { asset in
                    NavigationLink {
                        AssetDetailView(asset: asset)
                        
                    } label: {
                        AssetView(assetViewState: .init(asset))
                        
                    }
                   
                }
            }
            .listStyle(.automatic)
            .task {
                await viewModel.fetchAssets()
            }
            .navigationTitle("Home")
    //        .onAppear{
    //            Task {
    //                await viewModel.fetchAssets()
    //            }
    //        }
    //        .onDisappear{
    //
    //        }
    //        .task {
    //            await viewModel.fetchAssets()
    //        }
            
            /*Button ("Fetch assets") {
                Task {
                    await viewModel.fetchAssets()
                }
            }*/
        }
    }
}

#Preview {
    AssetList()
}
