//
//  ImagesView.swift
//  SnapChatEffect
//
//  Created by Giovanni Gaffé on 2021/10/21.
//

import SwiftUI

struct ImagesView: View {
    let title: String
    let imageName: String
    
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: geo.size.width)
                    
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding()
                
                Text(title)
                    .font(.title2)
                    .offset(y: -60)
                    .foregroundColor(.random)
            }
        }
    }
}

struct ImagesView_Previews: PreviewProvider {
    static var previews: some View {
        ImagesView(title: "Haloween", imageName: "haloween-1")
    }
}

extension Color {
    static var random: Color {
        return Color(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1))
    }
}
