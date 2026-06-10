//
//  MockPostService.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

final class MockAPIClientService: APIClientProtocol {
    
    func fetchUserDicData() async throws -> UserDataModel {
        let address = Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: .init(lat: "-37.3159", lng: "81.1496"))
        let company = Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets")
        return [
            UserData(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", address: address, phone: "1-770-736-8031 x56442", website: "hildegard.org", company: company)
        ]
    }
}
