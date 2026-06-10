//
//  UserDirectoryCell.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import SwiftUI

struct UserDirectoryCell: View {
    
    let user: UserEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(user.name, systemImage: "person.circle.fill")
                .font(.headline)
            
            Label(user.email.lowercased(), systemImage: "envelope.fill")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(user.companyName)
                .font(.footnote)
                .fontWeight(.medium)
                .foregroundColor(.blue)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemGroupedBackground))
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .shadow(color: .black.opacity(0.05), radius: 4)
    }
}

#Preview {
    let userData = UserEntity(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", streetAddress: "Kulas Light", addressSuite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", lat: "-37.3159", lng: "81.1496", phone: "1-770-736-8031 x56442", website: "hildegard.org", companyName: "Romaguera-Crona", companyCatchPhrase: "Multi-layered client-server neural-net", companyBS: "harness real-time e-markets")
    
    return UserDirectoryCell(user: userData)
}
