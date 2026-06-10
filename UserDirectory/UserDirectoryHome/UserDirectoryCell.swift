//
//  UserDirectoryCell.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import SwiftUI

struct UserDirectoryCell: View {
    
    let user: UserData
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Label(user.name ?? "", systemImage: "person.circle.fill")
                .font(.headline)
            
            Label(user.email?.lowercased() ?? "", systemImage: "envelope.fill")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(user.company?.name ?? "")
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
    let address = Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: .init(lat: "-37.3159", lng: "81.1496"))
    let company = Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets")
    let userData =
        UserData(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", address: address, phone: "1-770-736-8031 x56442", website: "hildegard.org", company: company)
    
    return UserDirectoryCell(user: userData)
}
