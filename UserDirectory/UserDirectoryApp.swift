//
//  UserDirectoryApp.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import SwiftUI
import SwiftData

@main
struct UserDirectoryApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            let apiClientService = APIClient()
            UserDirectoryView(viewModel: UserDirectoryViewModel(apiclientProtocol: apiClientService))
        }
        .modelContainer(sharedModelContainer)
    }
}
