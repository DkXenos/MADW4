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
                    Text("Welcome back, \(authVM.username.isEmpty ? "User" : authVM.username)")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("Your Library")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    if bookVM.savedBooks.isEmpty {
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
                        HStack {
                            Text("Recently Saved")
                                .font(.headline)
                                .fontWeight(.bold)
                            Spacer()
                            Text("\(bookVM.savedBooks.count) Books")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        VStack(spacing: 12) {
                            ForEach(bookVM.savedBooks.prefix(5)) { book in
                                NavigationLink(destination: BookDetailView(book: book).environmentObject(bookVM)) {
                                    HStack(spacing: 14) {
                                        RoundedRectangle(cornerRadius: 12)
                                            .fill(Color(.systemGray6))
                                            .frame(width: 60, height: 80)
                                            .overlay(
                                                Image(systemName: book.icon)
                                                    .font(.system(size: 24))
                                                    .foregroundColor(.black)
                                            )
                                        
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text(book.title)
                                                .font(.subheadline)
                                                .fontWeight(.semibold)
                                                .foregroundColor(.primary)
                                                .lineLimit(1)
                                            
                                            Text(book.author)
                                                .font(.caption)
                                                .foregroundColor(.gray)
                                            
                                            Text("\(book.pages) pages")
                                                .font(.caption2)
                                                .foregroundColor(.gray)
                                        }
                                        
                                        Spacer()
                                        
                                        Image(systemName: "chevron.right")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    .padding(12)
                                    .background(Color(.systemGray6))
                                    .cornerRadius(14)
                                }
                            }
                        }
                        
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
