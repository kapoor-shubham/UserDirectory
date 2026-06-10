//
//  Item.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import Foundation
import SwiftData

@Model
final class UserEntity {
    
    var id: Int
    var name: String
    var username: String
    var email: String
    var streetAddress: String
    var addressSuite: String
    var city: String
    var zipcode: String
    var lat: String
    var lng: String
    var phone: String
    var website: String
    var companyName: String
    var companyCatchPhrase: String
    var companyBS: String
    
    init(id: Int, name: String, username: String, email: String, streetAddress: String, addressSuite: String, city: String, zipcode: String, lat: String, lng: String, phone: String, website: String, companyName: String, companyCatchPhrase: String, companyBS: String) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.streetAddress = streetAddress
        self.addressSuite = addressSuite
        self.city = city
        self.zipcode = zipcode
        self.lat = lat
        self.lng = lng
        self.phone = phone
        self.website = website
        self.companyName = companyName
        self.companyCatchPhrase = companyCatchPhrase
        self.companyBS = companyBS
    }
}
