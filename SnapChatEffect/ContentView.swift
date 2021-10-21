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
    
    var body: some View {
        Text("Hello, world!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
