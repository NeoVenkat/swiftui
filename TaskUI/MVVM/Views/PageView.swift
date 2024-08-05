//
//  PageView.swift
//  TaskUI
//
//  Created by Neosoft on 29/07/24.
//

// Views/ImageItemPage.swift
import SwiftUI
struct ImageItemPage: View {
    let item: ImageItem
    
    var body: some View {
        VStack {
            if let image = item.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            }
            Text(item.name)
                .font(.headline)
        }
    }
}
