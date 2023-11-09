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
    @State private var page = 0
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
                    }
                )
                HStack(alignment: .center) {
                    LittleLemonLogo()
                }
                .padding()
                Spacer()

                TabView(selection: $page) {
                    VStack(alignment: .leading) {
                        Spacer()
                        Text("First Name")
                            .fontWeight(.bold)
                        TextField("First Name", text: $firstName)
                            .textFieldStyle(.roundedBorder)
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
                                if !firstName.isEmpty {
                                    page = 1
                                }
                            } label: {
                                Text("Next")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .background(Color.jonquil)
                            .cornerRadius(15)
                            Spacer()
                        }
                        Spacer()
                    }
                    .tabItem {
                        EmptyView()
                    }
                    .tag(0)

                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Last Name")
                            .fontWeight(.bold)
                        TextField("Last Name", text: $lastName)
                            .textFieldStyle(.roundedBorder)
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
                                page = 0
                            } label: {
                                Text("Back")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .background(Color.feldgrau)
                            .cornerRadius(15)

                            Button {
                                if !lastName.isEmpty {
                                    page = 2
                                }
                            } label: {
                                Text("Next")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .background(Color.jonquil)
                            .cornerRadius(15)
                            Spacer()
                        }
                        Spacer()
                    }
                    .tabItem {
                        EmptyView()
                    }
                    .tag(1)

                    VStack(alignment: .leading) {
                        Spacer()
                        Text("Email")
                            .fontWeight(.bold)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .textFieldStyle(.roundedBorder)
                            .textInputAutocapitalization(.never)
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
                                page = 1
                            } label: {
                                Text("Back")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .background(Color.feldgrau)
                            .cornerRadius(15)

                            Button(action: {
                                if !firstName.isEmpty, !lastName.isEmpty, !email.isEmpty {
                                    UserDefaults.standard.set(firstName, forKey: firstNameKey)
                                    UserDefaults.standard.set(lastName, forKey: lastNameKey)
                                    UserDefaults.standard.set(email, forKey: emailKey)
                                    UserDefaults.standard.set(true, forKey: "isLoggedIn")

                                    $isLoggedIn.wrappedValue.toggle()
                                }
                            }) {
                                Text("Register")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                            }
                            .background(Color.jonquil)
                            .cornerRadius(15)
                            Spacer()
                        }
                        Spacer()
                    }
                    .tabItem {
                        EmptyView()
                    }
                    .tag(2)
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .autocorrectionDisabled()
                .padding(.horizontal)

                Spacer()
            }
            .onAppear {
                if UserDefaults.standard.bool(forKey: "isLoggedIn") {
                    $isLoggedIn.wrappedValue.toggle()
                }
            }
        }
    }
}
