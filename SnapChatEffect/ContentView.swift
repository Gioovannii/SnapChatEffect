//
//  ContentView.swift
//  SnapChatEffect
//
//  Created by Giovanni Gaffé on 2021/10/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isShown = false
    @Namespace private var namespace
    
    // MARK: - Numbers of items in row
    
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 140)),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Fixed height
    let height: CGFloat = 150
    var imagesHaloween: [String] {
        var imageNames = [String]()
        for i in 1..<8 {
            imageNames.append("haloween-\(i)")
        }
        return imageNames
    }
    
    var body: some View {
        
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.black, .orange]), startPoint: .topTrailing, endPoint: .bottom)
                .ignoresSafeArea(.all)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(imagesHaloween, id: \.self) { image in
                        
                        Button{ print("\(image) was tapped")} label: {
                            Image(image)
                                .resizable()
                                .frame(height: height)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                        }
                    }
                }
                .padding(.top, 50)
                .padding()
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
