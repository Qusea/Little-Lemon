//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Qusea Saif on 10/30/23.
//

import SwiftUI

struct UserProfile: View {
	@Environment(\.presentationMode) var presentationMode
	@AppStorage(firstNameKey) var firstName = ""
	@AppStorage(lastNameKey) var lastName = ""
	@AppStorage(emailKey) var email = ""

	var body: some View {
		VStack {
			HStack(alignment: .center) {
				LittleLemonLogo()
			}
			.padding()
			Spacer()
			Text("Personal information")
			Image("profile-image-placeholder")
				.resizable()
				.frame(width: 100, height: 100)
				.clipShape(Circle())
				.padding(.bottom, 20)
			Text("First Name")
				.fontWeight(.bold)
			TextField("First Name", text: $firstName)
				.textFieldStyle(.roundedBorder)
			Text("Last Name")
				.fontWeight(.bold)
			TextField("Last Name", text: $lastName)
				.textFieldStyle(.roundedBorder)
			Text("Email")
				.fontWeight(.bold)
			TextField("Email", text: $email)
				.keyboardType(.emailAddress)
				.textFieldStyle(.roundedBorder)
				.textInputAutocapitalization(.never)

			Spacer()
			Button(action: {
				if !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty {
					UserDefaults.standard.set(firstName, forKey: firstNameKey)
					UserDefaults.standard.set(lastName, forKey: lastNameKey)
					UserDefaults.standard.set(email, forKey: emailKey)
					print("Saved")
				}
			}) {
				Text("Save")
					.font(.headline)
					.foregroundColor(.white)
					.padding()
			}
			.background(Color.jonquil)
			.cornerRadius(15)

			Spacer()
			Button(action: {
				UserDefaults.standard.removeObject(forKey: firstNameKey)
				UserDefaults.standard.removeObject(forKey: lastNameKey)
				UserDefaults.standard.removeObject(forKey: emailKey)
				UserDefaults.standard.set(false, forKey: "isLoggedIn")
				print("Logged Out")
				self.presentationMode.wrappedValue.dismiss()
			}) {
				Text("Logout")
			}
			Spacer()
		}
		.autocorrectionDisabled()
		.padding(.horizontal)
	}
}
