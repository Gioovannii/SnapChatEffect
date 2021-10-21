//
//  HaloweenImage.swift
//  SnapChatEffect
//
//  Created by Giovanni Gaffé on 2021/10/21.
//

import SwiftUI


struct Image: Identifiable {
    let id = UUID()
    let title: String
    let imageName: String
}

struct RowView: View {
    let images: [Image]
    let width: CGFloat
    let height: CGFloat
    let horizontalSpacing: CGFloat
    
    
    var body: some View {
        HStack(spacing: horizontalSpacing) {
            ForEach(images) { image in
                ImagesView(title: image.title, imageName: image.imageName)
                    .frame(width: width, height: height)
            }
        }
        .padding()
    }
    
    
}
struct HaloweenImage: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct HaloweenImage_Previews: PreviewProvider {
    static var previews: some View {
        HaloweenImage()
    }
}
