//
//  SplashView.swift
//  TaskUI
//
//  Created by Neosoft on 05/08/24.
//

import SwiftUI
struct SplashView: View {
    
    @State private var isPresented: Bool = false
    var body: some View {
        ZStack {
            if isPresented {
                ContentView()
            } else {
                VStack{
                    Spacer()
                    Text("")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    Text("")
                        .font(.largeTitle)
                }.padding(.all, 10)
            }
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now()) {
                withAnimation{
                    self.isPresented = true
                }
            }
        })
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
