import SwiftUI

struct ContentView: View {
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = UIColor.systemBlue
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.lightGray
        UITableView.appearance().sectionHeaderHeight = 0
        UITableView.appearance().sectionFooterHeight = 0
        UITableView.appearance().sectionHeaderTopPadding = 0
    }
    
    @StateObject private var viewModel = ItemsViewModel()
    @State private var searchText = ""
    @State private var isSearching = false
    @State private var showActionSheet: Bool = false
    
    var body: some View {
        // Navigation stack for handling navigation
        NavigationStack {
            VStack {
                ScrollView {
                    // Carousel View
                    CarousalView()
                    
                    // Search View with Item Listing
                    SearchViewWithItemListing()
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal, 10)
            }
            .navigationBarTitle(self.viewModel.selectedCategory.uppercased(), displayMode: .inline)
            .onTapGesture {
                hideKeyboard()
                withAnimation {
                    self.isSearching = false
                }
                self.searchText = ""
                self.viewModel.filterItems(self.viewModel.selectedCategory, "")
            }
            .onAppear {
                // Load data from view model
                self.viewModel.loadData()
            }
            .overlay(
                // Floating Button
                FloatingButton()
            )
        }
    }
    
    // Carousel View
    @ViewBuilder
    func CarousalView() -> some View {
        if !isSearching {
            CarouselGridView(viewModel: self.viewModel, selectedCategoryIndex: self.$viewModel.selectedCategory)
                .onChange(of: self.viewModel.selectedCategory) { _ in
                    self.viewModel.filterItems(self.viewModel.selectedCategory, "")
                }
                .padding(.bottom, -25)
        }
    }

   
    @ViewBuilder
    func SearchViewWithItemListing() -> some View {
        // LazyVStack to handle search and item list
        LazyVStack(pinnedViews: .sectionHeaders) {
            // Section for handling search bar stuck on top view
            Section(header: SearchView(text: $searchText, isSearching: $isSearching)
                .background(.white)
                .onChange(of: searchText) { newValue in
                    self.viewModel.filterItems(self.viewModel.selectedCategory, newValue)
                }
            ) {
                // Filtered Item List
                ForEach(self.viewModel.filteredItems) { items in
                    // Items Cell
                    ListCellView(locationData: items)
                }
            }
        }
    }



    
    // Floating Button
    @ViewBuilder
    func FloatingButton() -> some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    showActionSheet.toggle()
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .frame(width: 30, height: 30)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                .shadow(radius: 10)
                .padding()
                .sheet(isPresented: $showActionSheet) {
                    CustomActionSheetView(isPresented: $showActionSheet, title: "Statistics", message: self.viewModel.getStatistics())
                        .transition(.move(edge: .bottom))
                        .presentationBackground(.clear)
                        .presentationDragIndicator(.hidden)
                        .presentationDetents([.height(250)])
                }
            }
        }
    }
    
    // Function to handle hide keyboard on outside click
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

