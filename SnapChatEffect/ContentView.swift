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

    var column: [GridItem] = [
        GridItem(.flexible(minimum: 140)),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    // MARK: - Fixed height
    let height: CGFloat = 150
    var imagesHaloween: [String] {
        var imageNames = [String]()
        for i in 1..<7 {
            imageNames.append("haloween-\(i)")
        }
        return imageNames
    }
    
    var body: some View {
        VStack {
            ForEach(imagesHaloween, id: \.self) { image in
                Image(image)
                    .resizable()
                    .frame(width: 60)
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
