//
//  UserListView.swift
//  Ryze2.0
//
//  Created by Asraful Alam on 26/7/25.
//

import SwiftUI

struct UserListView: View {
    @StateObject private var viewModel: UserListViewModel
    @State private var path = NavigationPath()
    
    init() {
        let networkManager = NetworkManager()
        let repository = UserRepository(networkManager: networkManager)
        let useCase = FetchUsersUseCase(repository: repository)
        _viewModel = StateObject(wrappedValue: UserListViewModel(fetchUsersUseCase: useCase))
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                ProfileNavigationBar(
                    imageUrl: "https://picsum.photos/200",
                    username: "Asraful Alam"
                ) {
                    viewModel.fetchUsers()
                }

                if viewModel.isLoading {
                    Spacer()
                    ProgressView("Loading...")
                    Spacer()
                } else if let error = viewModel.errorMessage {
                    Spacer()
                    Text("Error: \(error)").foregroundColor(.red)
                    Spacer()
                } else if viewModel.users.isEmpty {
                    Spacer()
                    Text("No users found.")
                    Spacer()
                } else {
                    List(viewModel.users) { user in
                        UserRowView(user: user) {
                            path.append(Route.userDetail(user))
                        }
                    }
                    .listStyle(.plain)
                    .refreshable {
                        viewModel.fetchUsers() 
                    }
                }
            }
            .onAppear {
                if viewModel.users.isEmpty {
                    viewModel.fetchUsers()
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .userDetail(let user):
                    DetailView(user: user, path: $path)
                }
            }
        }
    }
}


struct UserListView_Previews: PreviewProvider {
    static var previews: some View {
        UserListView()
    }
}


enum Route: Hashable {
    case userDetail(User)
}
