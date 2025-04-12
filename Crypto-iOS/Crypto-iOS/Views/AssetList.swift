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
        Text(viewModel.errorMessage ?? "")
        List {
            ForEach(viewModel.assets, id: \.id) { asset in
                AssetView(asset: asset)
            }
        }
        Button ("Fetch assets") {
            Task {
                await viewModel.fetchAssets()
            }
        }
    }
}

#Preview {
    AssetList()
}
