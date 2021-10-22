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
    @State var imageName: String
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
            
            if !isShown {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(imagesHaloween, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .frame(height: height)
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .onTapGesture {
                                    withAnimation(.default) {
                                        isShown.toggle()
                                        imageName = image
                                    }
                                }
                        }
                    }
                }
                .padding(.top, 50)
                .padding()
                
                
                
            } else {
                
                ZStack {
                    GeometryReader { geo in
                        VStack(alignment: .center) {
                            Image(imageName)
                                .matchedGeometryEffect(id: "image", in: namespace)
                                .scaledToFit()
                                .frame(height: geo.size.height)
                        }
                    }
                }
                .onTapGesture {
                    withAnimation(.default) {
                        isShown.toggle()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(imageName: "haloween-1")
    }
}
