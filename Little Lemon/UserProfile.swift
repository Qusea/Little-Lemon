//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Qusea Saif on 10/30/23.
//

import SwiftUI

struct UserProfile: View {

	@Environment(\.presentationMode) var presentationMode
	let firstName = UserDefaults.standard.string(forKey: firstNameKey) ?? ""
	let lastName = UserDefaults.standard.string(forKey: lastNameKey) ?? ""
	let email = UserDefaults.standard.string(forKey: emailKey) ?? ""

    var body: some View {
		VStack {
			Text("Personal information")
			Image("profile-image-placeholder")
				.resizable()
				.frame(width: 100, height: 100)
				.clipShape(Circle())
				.padding(.bottom, 20)
			Text("First Name: \(firstName)")
			Text("Last Name: \(lastName)")
			Text("Email: \(email)")

			Button(action: {
				UserDefaults.standard.set(false, forKey: "isLoggedIn")
				self.presentationMode.wrappedValue.dismiss()
			}) {
				Text("Logout")
			}
		}
    }
}

#Preview {
    UserProfile()
}
