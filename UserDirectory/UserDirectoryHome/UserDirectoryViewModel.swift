//
//  UserDirectoryViewModel.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import Foundation
import Observation

@MainActor
@Observable
class UserDirectoryViewModel {
    
    private let userRepoProtocol: UserRepositoryProtocol
    
    var userData: [UserEntity] = []
    
    init(userRepoProtocol: UserRepositoryProtocol) {
        self.userRepoProtocol = userRepoProtocol
    }
    
    func loadFreshData() async {
        do {
            try await userRepoProtocol.fetchAndStoreUsers()
            try await fetchDataFromDB()
        } catch {
            print(error)
        }
    }
    
    func fetchDataFromDB() async throws {
        userData = try userRepoProtocol.getUsers()
    }
}
