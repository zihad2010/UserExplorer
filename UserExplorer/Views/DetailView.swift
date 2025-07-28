//
//  DetailView.swift
//  Ryze2.0
//
//  Created by Asraful Alam on 28/7/25.
//

//struct DetailView: View {
//    @Binding var path: NavigationPath
//
//    var body: some View {
//        VStack(spacing: 20) {
//            CustomNavigationBar(title: "Detail") {
//                print(path)
//                path.removeLast() // 👈 Pop the current view
//            }
//            Spacer()
//        }
//        .navigationBarBackButtonHidden(true)
//    }
//}

import SwiftUI

struct DetailView: View {
    let user: User
    @Binding var path: NavigationPath
    
    var body: some View {
        
        VStack {
            DetailsNavigationBar(showBackButton: true, title: "User Detail") {
                path.removeLast()
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text(user.name)
                            .font(.title)
                            .bold()
                        
                        Label(user.email, systemImage: "envelope")
                        Label(user.phone, systemImage: "phone")
                        Label(user.website, systemImage: "globe")
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Address")
                            .font(.headline)
                        Text("\(user.address.street), \(user.address.suite)")
                        Text("\(user.address.city) - \(user.address.zipcode)")
                        Text("Geo: \(user.address.geo.lat), \(user.address.geo.lng)")
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Company")
                            .font(.headline)
                        Text(user.company.name)
                        Text("\"\(user.company.catchPhrase)\"")
                            .italic()
                        Text(user.company.bs)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
            }
            .navigationBarBackButtonHidden(true)
            
        }
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(user: sampleUser, path: .constant(NavigationPath()))
    }
}

let sampleUser = User(
    id: 1,
    name: "Asraful Alam",
    username: "asrafuldev",
    email: "asraful@example.com",
    address: Address(
        street: "123 Swift Road",
        suite: "Apt 456",
        city: "Dhaka",
        zipcode: "1205",
        geo: Geo(lat: "23.8103", lng: "90.4125")
    ),
    phone: "+880123456789",
    website: "asraful.dev",
    company: Company(
        name: "Swift Minds Ltd.",
        catchPhrase: "Innovate. Iterate. Inspire.",
        bs: "Mobile-first transformation"
    )
)
