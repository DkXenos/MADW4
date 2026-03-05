//
//  RegisterView.swift
//  Lab_Week_4
//
//  Created by Jason TIo on 05/03/26.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            
            // App Icon
            Image(systemName: "doc.text")
                .font(.system(size: 50))
                .foregroundColor(.black)
            
            Text("BookApp")
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
                .frame(height: 20)
            
            // Full Name Field
            TextField("Full Name", text: $fullName)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .autocapitalization(.words)
                .disableAutocorrection(true)
            
            // Email Field
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .keyboardType(.emailAddress)
            
            // Password Field
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            
            // Register Button
            Button(action: {
                authVM.register(fullName: fullName, email: email, password: password)
            }) {
                Text("Register")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
            
            Spacer()
            
            // Navigate to Login
            HStack(spacing: 4) {
                Text("Already have an account?")
                    .foregroundColor(.gray)
                    .font(.footnote)
                Button(action: {
                    dismiss()
                }) {
                    Text("Sign In")
                        .fontWeight(.bold)
                        .font(.footnote)
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom, 20)
        }
        .padding(.horizontal, 30)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    NavigationStack {
        RegisterView()
            .environmentObject(AuthViewModel())
    }
}
