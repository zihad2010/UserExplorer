//
//  UserRowView.swift
//  Ryze2.0
//
//  Created by Asraful Alam on 28/7/25.
//

import SwiftUI

struct UserRowView: View {
    let user: User
    let onDetailTap: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(user.name)
                .font(.headline)

            Text(user.email)
                .font(.subheadline)
                .foregroundColor(.gray)

            Text(user.company.name)
                .font(.caption)
                .foregroundColor(.blue)

            HStack {
                Spacer()
                Button(action: onDetailTap) {
                    Text("View Details")
                        .font(.footnote)
                        .padding(.horizontal)
                        .padding(.vertical, 6)
                        .background(Color.blue.opacity(0.1))
                        .cornerRadius(8)
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    UserRowView(user: sampleUser) {
        print("Tapped")
    }
}

#Preview {
    DetailView(user: sampleUser, path: .constant(NavigationPath()))
}
