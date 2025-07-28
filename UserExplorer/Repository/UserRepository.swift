//
//  UserRepository.swift
//  UserListApp
//
//  Created by Asraful Alam on 20/7/25.
//

import Combine

protocol UserRepositoryProtocol {
    func fetchUsers() -> AnyPublisher<[User], NetworkError>
}

class UserRepository: UserRepositoryProtocol {
    private let networkManager: NetworkManagerProtocol

    init(networkManager: NetworkManagerProtocol = NetworkManager()) {
        self.networkManager = networkManager
    }

    func fetchUsers() -> AnyPublisher<[User], NetworkError> {
        return networkManager.getData(.getUsers)
    }
}
