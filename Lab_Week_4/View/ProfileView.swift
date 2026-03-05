//
//  ProfileView.swift
//  Lab_Week_4
//
//  Created by Jason TIo on 05/03/26.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var bookVM: BookViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Spacer()
                    .frame(height: 20)
                
                Circle()
                    .fill(Color(.systemGray5))
                    .frame(width: 100, height: 100)
                    .overlay(
                        Image(systemName: "person")
                            .font(.system(size: 40))
                            .foregroundColor(.gray)
                    )
                
                Text(authVM.fullName.isEmpty ? "John Doe" : authVM.fullName)
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text(authVM.email.isEmpty ? "john.doe@example.com" : authVM.email)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text("Avid reader, tech enthusiast, and minimalist.")
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 40)
                
                Spacer()
                
                Button(action: {
                    authVM.logout()
                }) {
                    Text("Sign Out")
                        .fontWeight(.semibold)
                        .foregroundColor(.red)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red.opacity(0.08))
                        .cornerRadius(12)
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 30)
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
        .environmentObject(BookViewModel())
}
