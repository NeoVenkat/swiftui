
//
//  CustomActionSheetView.swift
//  TaskUI
//
//  Created by Neosoft on 05/08/24.
//

import SwiftUI

struct CustomActionSheetView: View {
    @Binding var isPresented: Bool
    var title: String
    var message: String
    
    var body: some View {
        ZStack{
                VStack(spacing: 10) {
                    Spacer()
                    VStack(spacing: 10) {
                        Text(title)
                            .font(.headline) // Increase title font size
                            .multilineTextAlignment(.center)
                            .padding(.top)
                        
                        Text(message)
                            .font(.callout) // Increase message font size
                            .multilineTextAlignment(.center)
                            .padding(.horizontal)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 20)
                    .background(.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .padding(.horizontal)
                    
                    Button(action: {
                        isPresented = false
                    }) {
                        Text("Cancel")
                            .font(.title2) // Increase cancel button font size
                            .fontWeight(.semibold)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.white)
                            .foregroundColor(.blue)
                            .cornerRadius(15)
                            .shadow(radius: 10)
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 30)
                }
                .ignoresSafeArea()
        }
        .edgesIgnoringSafeArea(.all)
        .animation(.easeInOut(duration: 0.25), value: isPresented)
        .onTapGesture {
            isPresented = false
        }
    }
}


struct CustomActionSheetView_Previews: PreviewProvider {
    static var previews: some View {
        CustomActionSheetView(isPresented: .constant(true), title: "", message: "")

        
    }
}
