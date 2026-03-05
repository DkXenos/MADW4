//
//  LoginView.swift
//  Lab_Week_4
//
//  Created by Jason TIo on 05/03/26.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authVM: AuthViewModel
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showRegister: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                
                Image(systemName: "doc.text")
                    .font(.system(size: 50))
                    .foregroundColor(.black)
                
                Text("BookApp")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                    .frame(height: 20)
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                
                Button(action: {
                    authVM.login(username: username, password: password)
                }) {
                    Text("Sign In")
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(10)
                }
                
                Spacer()
                
                HStack(spacing: 4) {
                    Text("Don't have an account?")
                        .foregroundColor(.gray)
                        .font(.footnote)
                    Button(action: {
                        showRegister = true
                    }) {
                        Text("Sign Up")
                            .fontWeight(.bold)
                            .font(.footnote)
                            .foregroundColor(.black)
                    }
                }
                .padding(.bottom, 20)
            }
            .padding(.horizontal, 30)
            .navigationDestination(isPresented: $showRegister) {
                RegisterView()
                    .environmentObject(authVM)
            }
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
}
