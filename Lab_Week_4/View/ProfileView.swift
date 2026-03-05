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
            VStack(spacing: 24) {
                Spacer()
                    .frame(height: 20)
                
                // Profile Avatar
                Image(systemName: "person.circle.fill")
                    .font(.system(size: 80))
                    .foregroundColor(.gray)
                
                // User Info
                VStack(spacing: 6) {
                    Text(authVM.fullName.isEmpty ? "User" : authVM.fullName)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Text(authVM.email.isEmpty ? authVM.username : authVM.email)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                
                // Stats
                HStack(spacing: 40) {
                    VStack(spacing: 4) {
                        Text("\(bookVM.savedBooks.count)")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("Saved")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    
                    VStack(spacing: 4) {
                        Text("\(bookVM.books.count)")
                            .font(.title3)
                            .fontWeight(.bold)
                        Text("Available")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                Spacer()
                
                // Logout Button
                Button(action: {
                    authVM.logout()
                }) {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Log Out")
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red.opacity(0.1))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .padding(.horizontal)
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    ProfileView()
        .environmentObject(AuthViewModel())
        .environmentObject(BookViewModel())
}
