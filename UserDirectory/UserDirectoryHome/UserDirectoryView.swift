//
//  ContentView.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import SwiftUI

struct UserDirectoryView: View {
    
    @State private var selectedUser: UserEntity?
    @State private var viewModel: UserDirectoryViewModel
    
    init(selectedUser: UserEntity? = nil, viewModel: UserDirectoryViewModel) {
        self.selectedUser = selectedUser
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            VStack {
                Text("User Directory")
                    .padding([.leading, .top], 20)
                    .font(.system(size: 35, weight: .bold, design: .default))
                
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.userData, id: \.id) { user in
                            UserDirectoryCell(user: user)
                                .onTapGesture {
                                    selectedUser = user
                                }
                        }
                    }
                    .padding()
                }
                .navigationDestination(item: $selectedUser) { user in
                    UserDetailView(userDetails: user)
                }
            }
            .task {
                await viewModel.loadFreshData()
            }
        }
    }
}
