//
//  NavigationBarView.swift
//  Ryze2.0
//
//  Created by Asraful Alam on 25/7/25.
//

import SwiftUI
import Combine

import SwiftUI

struct ProfileNavigationBar: View {
    var imageUrl: String
    var username: String
    var onRefresh: (() -> Void)? = nil

    var body: some View {
        HStack(spacing: 12) {
            CircleImageView(imageUrl: imageUrl, width: 40, height: 40)
                .accessibilityHidden(true)

            Text(username)
                .font(.system(size: 17, weight: .bold))
                .foregroundColor(.white)
                .accessibilityLabel("Logged in as \(username)")

            Spacer()

            if let onRefresh = onRefresh {
                Button(action: onRefresh) {
                    Image(systemName: "arrow.clockwise")
                        .foregroundColor(.white)
                }
                .accessibilityLabel("Refresh")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 16)
        .background(Color.black)
    }
}

struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileNavigationBar(
            imageUrl: "https://picsum.photos/200",
            username: "Asraful Alam"
        )
        .previewLayout(.sizeThatFits)
    }
}
