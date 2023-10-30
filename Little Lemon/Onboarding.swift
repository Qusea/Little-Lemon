//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Qusea Saif on 10/28/23.
//

let firstNameKey = "firstName"
let lastNameKey = "lastName"
let emailKey = "email"

import SwiftUI

struct Onboarding: View {

    @State private var isLoggedIn = false
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: Home(),
                    isActive: $isLoggedIn,
                    label: {
                        EmptyView()
                    })
                Form {
                    TextField("First Name", text: $firstName)
                        .padding()
                    TextField("Last Name", text: $lastName)
                        .padding()
                    TextField("Email", text: $email)
                        .padding()
                        .background(Color("LightGreen"))
                        .cornerRadius(5.0)
                        .padding(.bottom, 20)
                }
                Button(action: {
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        // add the following code to store the values of firstName, lastName and email in UserDefaults
                        UserDefaults.standard.set(self.firstName, forKey: firstNameKey)
                        UserDefaults.standard.set(self.lastName, forKey: lastNameKey)
                        UserDefaults.standard.set(self.email, forKey: emailKey)
                        // add the following code to change the value of the isOnboardingCompleted key to true
                        UserDefaults.standard.set(true, forKey: "isLoggedIn")
                        // add the following code to dismiss the registration page
    //                    self.presentationMode.wrappedValue.dismiss()
                        $isLoggedIn.wrappedValue.toggle()
                    }
                }) {
                    Text("Register")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 220, height: 60)
                        .background(Color("DarkGreen"))
                }
                .cornerRadius(15.0)
                .background(Color.yellow)
            }
            .onAppear() {
                if UserDefaults.standard.bool(forKey: "isLoggedIn") {
                    $isLoggedIn.wrappedValue.toggle()
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
