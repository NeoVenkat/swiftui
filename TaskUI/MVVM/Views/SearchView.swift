//
//  SearchView.swift
//  TaskUI
//
//  Created by Neosoft on 05/08/24.
//

import SwiftUI

struct SearchView: View {
    @Binding var text: String
    @Binding var isSearching: Bool
    
    var body: some View {
        HStack {
            TextField("Search", text: $text, onEditingChanged: { isEditing in
                withAnimation {
                    isSearching = isEditing
                }
            })
            .autocorrectionDisabled()
            .textInputAutocapitalization(.never)
            .padding(10)
            .padding(.horizontal, 25)
            .background(Color(.systemGray3))
            .cornerRadius(8)
            .overlay( // Added overlay to show and hide cancel button and
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 10)
                    
                    if !text.isEmpty {
                        Button(action: {
                            text = ""
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 10)
                        }
                    }
                }
            )
        }
        .background(.white)
        .padding()
        .padding(.horizontal, -15)
    }
}



struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(text: .constant(""), isSearching: .constant(false))
    }
}
