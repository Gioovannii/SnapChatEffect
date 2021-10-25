//
//  DetailView.swift
//  SnapChatEffect
//
//  Created by Giovanni Gaffé on 2021/10/23.
//

import SwiftUI

struct DetailView: View {
    let height: CGFloat = 150
    let image: String
    
    var imagesHaloween: [String] {
        var imageNames = [String]()
        for i in 1..<8 {
            imageNames.append("haloween-\(i)")
        }
        return imageNames
    }
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(height: height)
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: "haloween-1")
    }
}
