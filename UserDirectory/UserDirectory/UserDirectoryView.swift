//
//  ContentView.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import SwiftUI
import SwiftData

struct UserDirectoryView: View {

    @State private var viewModel: UserDirectoryViewModel
    
    init(viewModel: UserDirectoryViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack {
            List {
                ForEach(viewModel.userData) { user in
                    VStack(alignment: .leading, content: {
                        Text(user.name ?? "NIL")
                    })
                }
            }
        }
        .task {
            await viewModel.fetchUserDirectoryData()
        }
    }
}

#Preview {
    let viewModel = UserDirectoryViewModel(apiclientProtocol: MockAPIClientService())
    UserDirectoryView(viewModel: viewModel)
        .modelContainer(for: Item.self, inMemory: true)
}
