//
//  HomeView.swift
//  Lab_Week_4
//
//  Created by Jason TIo on 05/03/26.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var bookVM: BookViewModel
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    // Welcome Header
                    Text("Welcome back, \(authVM.username.isEmpty ? "User" : authVM.username)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("Your Library")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    if bookVM.savedBooks.isEmpty {
                        // Empty State
                        VStack(spacing: 16) {
                            Spacer()
                                .frame(height: 80)
                            
                            Image(systemName: "bookmark.slash")
                                .font(.system(size: 50))
                                .foregroundColor(.gray)
                            
                            Text("No books saved yet.")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            NavigationLink(destination: ExploreView().environmentObject(bookVM)) {
                                Text("Discover Books")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                                    .padding(.horizontal, 24)
                                    .padding(.vertical, 12)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(10)
                            }
                            
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                    } else {
                        // Recently Saved Section
                        HStack {
                            Text("Recently Saved")
                                .font(.headline)
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(bookVM.savedBooks.count) Books")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        // Horizontal scroll of saved books
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 16) {
                                ForEach(bookVM.savedBooks.prefix(5)) { book in
                                    NavigationLink(destination: BookDetailView(book: book).environmentObject(bookVM)) {
                                        VStack(alignment: .leading, spacing: 8) {
                                            // Book Card
                                            RoundedRectangle(cornerRadius: 12)
                                                .fill(Color(.systemGray6))
                                                .frame(width: 120, height: 160)
                                                .overlay(
                                                    Image(systemName: book.icon)
                                                        .font(.system(size: 40))
                                                        .foregroundColor(.black)
                                                )
                                            
                                            Text(book.title)
                                                .font(.caption)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.primary)
                                                .lineLimit(2)
                                                .frame(width: 120, alignment: .leading)
                                            
                                            Text(book.author)
                                                .font(.caption2)
                                                .foregroundColor(.gray)
                                                .frame(width: 120, alignment: .leading)
                                        }
                                    }
                                }
                            }
                        }
                        
                        // View All Saved Button
                        NavigationLink(destination: SavedBooksView().environmentObject(bookVM)) {
                            Text("View All Saved")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(10)
                        }
                        .padding(.top, 8)
                    }
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(BookViewModel())
        .environmentObject(AuthViewModel())
}
