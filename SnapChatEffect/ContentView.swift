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
    @State private var tempImages = [String]()
    
    // MARK: - Numbers of items in row
    var columns: [GridItem] = [
        GridItem(.flexible(minimum: 140)),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Computed property for images
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
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(imagesHaloween, id: \.self) { image in
                            DetailView(image: image)
                            
                                .onTapGesture {
                                    withAnimation(.easeIn) {
                                        isShown.toggle()
                                        tempImages.append(contentsOf: imagesHaloween)
                                        tempImages.insert(image, at: 0)
                                        print(tempImages)
                                    }
                                }
                        }
                    }
                }
                .matchedGeometryEffect(id: "shape", in: namespace)
                .padding(.top, 50)
                
            } else {
                
                ZStack {
                        GeometryReader { geo in
                                TabView {
                                    ForEach(tempImages, id: \.self) { image in
                                        Image(image)
                                            .resizable()
                                            .aspectRatio(0.78 ,contentMode: .fill)
                                            .frame(width: getRect().size.width, height: getRect().size.height)
                                            .cornerRadius(1)
                                            
                                            .frame(width: geo.size.width, height: geo.size.height)
                                            .rotationEffect(.degrees(-90))
                                            .frame(width: geo.size.height, height: geo.size.width)
                                    }
                                }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .matchedGeometryEffect(id: "shape", in: namespace)
                            .rotationEffect(.degrees(90))
                            .frame(width: geo.size.width)
                            
                        }
                }
                .ignoresSafeArea()
                .onTapGesture {
                    withAnimation(.default) {
                        isShown.toggle()
                    }
                }
            }
        }
    }
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
