//
//  Untitled.swift
//  Ryze2.0
//
//  Created by Asraful Alam on 28/7/25.
//
import SwiftUI
struct DetailsNavigationBar: View {
    var showBackButton: Bool = false
    var title: String
    var onBack: (() -> Void)?

    var body: some View {
        HStack {
            if let onBack = onBack {
                Button(action: onBack) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
            }

            Spacer()

            Text(title)
                .font(.headline)
                .foregroundColor(.white)

            Spacer()

            Spacer().frame(width: 24)
        }
        .padding()
        .background(Color.black)
        .shadow(radius: 1)
    }
}

struct DetailsNavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        DetailsNavigationBar( title: "User Datails")
    }
}
