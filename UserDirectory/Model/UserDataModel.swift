//
//  UserDataModel.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import Foundation

// MARK: - UserDatum
struct UserData: Identifiable, Codable, Hashable {
    let id: Int?
    let name, username, email: String?
    let address: Address?
    let phone, website: String?
    let company: Company?
}

// MARK: - Address
struct Address: Codable, Hashable {
    let street, suite, city, zipcode: String?
    let geo: Geo?
}

// MARK: - Geo
struct Geo: Codable, Hashable {
    let lat, lng: String?
}

// MARK: - Company
struct Company: Codable, Hashable {
    let name, catchPhrase, bs: String?
}

typealias UserDataModel = [UserData]
