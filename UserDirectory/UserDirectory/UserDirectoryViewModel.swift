//
//  UserDirectoryViewModel.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import Foundation
import Observation

@Observable
class UserDirectoryViewModel {
    
    private let apiclientProtocol: APIClientProtocol
    var userData: [UserData] = []
    
    init(apiclientProtocol: APIClientProtocol) {
        self.apiclientProtocol = apiclientProtocol
    }
    
    func fetchUserDirectoryData() async {
        do {
            userData = try await apiclientProtocol.fetchUserDicData()
        } catch {
            print(error)
        }
    }
}
