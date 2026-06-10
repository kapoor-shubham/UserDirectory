//
//  ContentView.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import SwiftUI

struct UserDirectoryView: View {

    @State private var viewModel: UserDirectoryViewModel
    
    init(viewModel: UserDirectoryViewModel) {
        self.viewModel = viewModel
    }
    var body: some View {
        VStack(alignment: .leading, content: {
            Text("User Directory")
                .padding([.leading, .top], 20)
                .font(.system(size: 35, weight: .bold, design: .default))
            
            List {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(viewModel.userData) { user in
                        UserDirectoryCell1(user: user)
                    }
                }
            }
        })
        .background(Color(.systemGroupedBackground))
        .task {
            await viewModel.fetchUserDirectoryData()
        }
    }
}

#Preview {
    let viewModel = UserDirectoryViewModel(apiclientProtocol: MockAPIClientService())
    UserDirectoryView(viewModel: viewModel)
}

struct UserDirectoryCell1: View {
    
    let user: UserData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(user.name ?? "")
                .font(.headline)
            
            Text(user.email ?? "")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(user.company?.name ?? "")
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(.blue)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
}
