//
//  UserDirectoryCell.swift
//  UserDirectory
//
//  Created by Shubham on 10/06/26.
//

import SwiftUI

struct UserDirectoryCell: View {
    
    let userDetails: UserData
    
    var body: some View {
        VStack(spacing: 20) {
            // Profile Header
            VStack(spacing: 12) {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                    .overlay(
                        Text((userDetails.name ?? "").prefix(1))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    )

                Text(userDetails.name ?? "")
                    .font(.title2)
                    .fontWeight(.bold)

                Text("@\(userDetails.username ?? "")")
                    .foregroundColor(.secondary)
            }
            .padding()

            // Contact Card
            InfoCardView(title: "Contact") {
                Label(userDetails.email ?? "", systemImage: "envelope.fill")
                Label(userDetails.phone ?? "", systemImage: "phone.fill")
                Label(userDetails.website ?? "", systemImage: "globe")
            }

            // Address Card
            InfoCardView(title: "Address") {
                Label(
                    "\(userDetails.address?.street ?? ""), \(userDetails.address?.suite ?? "")",
                    systemImage: "location.fill"
                )

                Text("\(userDetails.address?.city ?? ""), \(userDetails.address?.zipcode ?? "")")
                    .foregroundColor(.secondary)
                    .padding(.leading, 28)
            }

            // Company Card
            InfoCardView(title: "Company") {
                Text(userDetails.company?.name ?? "")
                    .fontWeight(.semibold)

                Text(userDetails.company?.catchPhrase ?? "")
                    .italic()
                    .foregroundColor(.blue)

                Text(userDetails.company?.bs ?? "")
                    .foregroundColor(.secondary)
            }
        }
    }
}

#Preview {
    let address = Address(street: "Kulas Light", suite: "Apt. 556", city: "Gwenborough", zipcode: "92998-3874", geo: .init(lat: "-37.3159", lng: "81.1496"))
    let company = Company(name: "Romaguera-Crona", catchPhrase: "Multi-layered client-server neural-net", bs: "harness real-time e-markets")
    let userData =
        UserData(id: 1, name: "Leanne Graham", username: "Bret", email: "Sincere@april.biz", address: address, phone: "1-770-736-8031 x56442", website: "hildegard.org", company: company)
    
    return UserDirectoryCell(userDetails: userData)
}
