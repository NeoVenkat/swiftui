//
//  ListCellView.swift
//  TaskUI
//
//  Created by Neosoft on 05/08/24.
//

import SwiftUI

struct ListCellView: View {
    var locationData: ItemData?

    var body: some View {
        HStack(alignment: .center) {
            if let imageName = locationData?.image, !imageName.isEmpty {
                Image(imageName) // Use local image asset
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(5)
                    .cornerRadius(10)
            } else {
                Color.gray // Placeholder in case there's no image
                    .frame(width: 80, height: 80)
                    .cornerRadius(10)
            }

            VStack(alignment: .leading, spacing: 10) {
                Text(locationData?.name ?? "")
                    .font(.headline)
                    .lineLimit(2)
                Text(locationData?.description ?? "")
                    .font(.caption)
                    .lineLimit(2)
            }
            .padding(.leading, 10)
        }
        .padding(.all, 10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal, 5)
        .listRowSeparator(.hidden)
    }
}

struct ListCellView_Previews: PreviewProvider {
    static var previews: some View {
        ListCellView()
    }
}
