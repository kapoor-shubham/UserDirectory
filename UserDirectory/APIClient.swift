//
//  APIClient.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import Foundation

protocol APIClientProtocol {
    func fetchUserDicData() async throws -> UserDataModel
}

final class APIClient: APIClientProtocol {
    func fetchUserDicData() async throws -> UserDataModel {
        guard let url = URL(string: APIEndPoints.baseURL + APIEndPoints.users) else {
            return []
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let httpResponse = response as? HTTPURLResponse,
                  200...299 ~= httpResponse.statusCode else {
                throw URLError(.badServerResponse)
            }
            return try JSONDecoder().decode(UserDataModel.self, from: data)
        } catch {
            throw error
        }
    }
}
