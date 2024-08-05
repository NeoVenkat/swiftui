//
//  ImageItemRow.swift
//  TaskUI
//
//  Created by Neosoft on 29/07/24.
//

// Views/ImageItemRow.swift
import SwiftUI

struct ImageItemRow: View {
    let item: ImageItem
    
    var body: some View {
        HStack {
            if let image = item.image {
                Image(uiImage: image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.detail)
                    .font(.subheadline)
                    .lineLimit(2)
            }
        }
    }
}
