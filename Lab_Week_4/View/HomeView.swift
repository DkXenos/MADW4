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
                        
                        let saved = Array(bookVM.savedBooks.prefix(6))
                        let rows = stride(from: 0, to: saved.count, by: 2).map {
                            Array(saved[$0..<min($0 + 2, saved.count)])
                        }
                        
                        VStack(spacing: 16) {
                            ForEach(rows, id: \.first!.id) { pair in
                                HStack(alignment: .top, spacing: 14) {
                                    ForEach(pair) { book in
                                        NavigationLink(destination: BookDetailView(book: book).environmentObject(bookVM)) {
                                            VStack(alignment: .leading, spacing: 6) {
                                                RoundedRectangle(cornerRadius: 12)
                                                    .fill(Color(.systemGray6))
                                                    .aspectRatio(0.9, contentMode: .fit)
                                                    .overlay(
                                                        Image(systemName: book.icon)
                                                            .font(.system(size: 36))
                                                            .foregroundColor(.black)
                                                    )
                                                
                                                Text(book.title)
                                                    .font(.subheadline)
                                                    .fontWeight(.semibold)
                                                    .foregroundColor(.primary)
                                                    .lineLimit(2)
                                                    .multilineTextAlignment(.leading)
                                                
                                                Text(book.author)
                                                    .font(.caption)
                                                    .foregroundColor(.gray)
                                            }
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        }
                                    }
                                    if pair.count == 1 {
                                        Spacer()
                                            .frame(maxWidth: .infinity)
                                    }
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
                .padding(.horizontal, 14)
                .padding(.vertical)
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
