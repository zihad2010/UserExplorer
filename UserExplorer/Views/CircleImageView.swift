//
//  CircleImageView.swift
//  Ryze2.0
//
//  Created by Asraful Alam on 25/7/25.
//

import SwiftUI

import SwiftUI

struct CircleImageView: View {
    let imageUrl: String
    let width: CGFloat
    let height: CGFloat
    var placeholderImage: String = "defaultProfile-icon"
    var strokeColor: Color = .white
    var strokeWidth: CGFloat = 2

    var body: some View {
        Group {
            if let url = URL(string: imageUrl) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure:
                        Image(placeholderImage)
                            .resizable()
                            .scaledToFill()
                    @unknown default:
                        Image(placeholderImage)
                            .resizable()
                            .scaledToFill()
                    }
                }
            } else {
                Image(placeholderImage)
                    .resizable()
                    .scaledToFill()
            }
        }
        .frame(width: width, height: height)
        .clipShape(Circle())
        .overlay(Circle().stroke(strokeColor, lineWidth: strokeWidth))
        .shadow(radius: 5)
        .accessibilityLabel("Profile image")
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(
            imageUrl: "https://picsum.photos/200",
            width: 100,
            height: 100
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
