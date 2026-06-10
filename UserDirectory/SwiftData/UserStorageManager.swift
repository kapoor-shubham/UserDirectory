//
//  UserStorageManager.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import SwiftData

final class UserStorageManager {

    private let modelContext: ModelContext

    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    // Save Users
    func save(users: UserDataModel) throws {
        for user in users {
            let entity = UserEntity(
                id: user.id ?? 0,
                name: user.name ?? "",
                username: user.username ?? "",
                email: user.email ?? "",
                streetAddress: user.address?.street ?? "",
                addressSuite: user.address?.suite ?? "",
                city: user.address?.city ?? "",
                zipcode: user.address?.zipcode ?? "",
                lat: user.address?.geo?.lat ?? "",
                lng: user.address?.geo?.lng ?? "",
                phone: user.phone ?? "",
                website: user.website ?? "",
                companyName: user.company?.name ?? "",
                companyCatchPhrase: user.company?.catchPhrase ?? "",
                companyBS: user.company?.bs ?? "")

            modelContext.insert(entity)
        }

        try modelContext.save()
    }

    // Fetch Users
    func fetchUsers() throws -> [UserEntity] {
        let descriptor = FetchDescriptor<UserEntity>()
        return try modelContext.fetch(descriptor)
    }

    // Delete All Users (Optional)
    func deleteAllUsers() throws {
        let descriptor = FetchDescriptor<UserEntity>()
        let users = try modelContext.fetch(descriptor)

        users.forEach { modelContext.delete($0) }
        try modelContext.save()
    }
}
