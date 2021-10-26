//
//  DetailView.swift
//  SnapChatEffect
//
//  Created by Giovanni Gaffé on 2021/10/23.
//

import SwiftUI

struct DetailView: View {
    let size: CGFloat = 120
    let image: String
    
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: size, height: size)
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(image: "haloween-1")
    }
}
