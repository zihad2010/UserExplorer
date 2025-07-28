//
//  FetchUsersUseCase.swift
//  Ryze2.0
//
//  Created by Asraful Alam on 26/7/25.
//

import Foundation
import Combine

protocol FetchUsersUseCaseProtocol {
    func execute() -> AnyPublisher<[User], NetworkError>
}

final class FetchUsersUseCase: FetchUsersUseCaseProtocol {
    private let repository: UserRepositoryProtocol

    init(repository: UserRepositoryProtocol) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[User], NetworkError> {
        return repository.fetchUsers()
    }
}
