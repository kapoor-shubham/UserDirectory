//
//  UserRepository.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import Foundation

final class UserRepository {

    private let storageManager: UserStorageManager
    private let apiClientProtocol: APIClientProtocol

    init(
        apiClientProtocol: APIClientProtocol,
        storageManager: UserStorageManager
    ) {
        self.apiClientProtocol = apiClientProtocol
        self.storageManager = storageManager
    }

    func fetchAndStoreUsers() async throws {
        let users = try await apiClientProtocol.fetchUserDicData()

        try storageManager.deleteAllUsers()
        try storageManager.save(users: users)
    }

    func getUsers() throws -> [UserEntity] {
        try storageManager.fetchUsers()
    }
}
