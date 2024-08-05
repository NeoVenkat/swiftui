//
//  CarouselGridView.swift
//  TaskUI
//
//  Created by Neosoft on 05/08/24.
//
import SwiftUI

struct CarouselGridView: View {
    @ObservedObject var viewModel: ItemsViewModel
    @Binding var selectedCategoryIndex: String

    var body: some View {
        // TabView to handle carousel view with page control
        TabView(selection: $selectedCategoryIndex) {
            ForEach(self.viewModel.categories, id: \.self) { category in
                let filteredItems = self.viewModel.items.filter { $0.item.lowercased() == category.lowercased() }
                
                // Ensure there is at least one item to display
                if let firstItem = filteredItems.first {
                    CategoryCarouselView(items: firstItem)
                        .tag(category)
                }
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
        .frame(height: 245)
        .onChange(of: selectedCategoryIndex) { newValue in
            self.viewModel.selectedCategory = newValue
        }
    }
}
struct CategoryCarouselView: View {
    let items: ItemData
    
    var body: some View {
        VStack {
            if let image = UIImage(named: items.image) {
                Image(uiImage: image)
                    .resizable()
                    .cornerRadius(10)
            } else {
                // Placeholder or empty view if image is not found
                Text("Image not found")
            }
            Spacer(minLength: 10)
        }
        .frame(height: 200)
    }
}


struct CarouselGridView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselGridView(
            viewModel: ItemsViewModel(),
            selectedCategoryIndex: .constant(ItemsViewModel().selectedCategory)
        )
    }
}
