//
//  SavedBooksView.swift
//  Lab_Week_4
//
//  Created by Jason TIo on 05/03/26.
//

import SwiftUI

struct SavedBooksView: View {
    @EnvironmentObject var bookVM: BookViewModel
    
    var body: some View {
        NavigationStack {
            Group {
                if bookVM.savedBooks.isEmpty {
                    // Empty State
                    VStack(spacing: 16) {
                        Spacer()
                        
                        Image(systemName: "bookmark")
                            .font(.system(size: 50))
                            .foregroundColor(.gray)
                        
                        Text("Your saved list is empty")
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                } else {
                    // Saved Books List
                    List {
                        ForEach(bookVM.savedBooks) { book in
                            NavigationLink(destination: BookDetailView(book: book).environmentObject(bookVM)) {
                                HStack(spacing: 14) {
                                    // Book Icon
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(Color(.systemGray6))
                                        .frame(width: 50, height: 50)
                                        .overlay(
                                            Image(systemName: book.icon)
                                                .font(.title3)
                                                .foregroundColor(.black)
                                        )
                                    
                                    // Book Info
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text(book.title)
                                            .font(.subheadline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.primary)
                                            .lineLimit(2)
                                        
                                        Text(book.author)
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Spacer()
                                    
                                    // Delete Button
                                    Button(action: {
                                        bookVM.removeSaved(for: book)
                                    }) {
                                        Image(systemName: "trash")
                                            .foregroundColor(.red.opacity(0.7))
                                            .padding(8)
                                            .background(Color.red.opacity(0.1))
                                            .cornerRadius(8)
                                    }
                                    .buttonStyle(.plain)
                                }
                                .padding(.vertical, 4)
                            }
                        }
                    }
                    .listStyle(.plain)
                }
            }
            .navigationTitle("Saved")
        }
    }
}

#Preview {
    SavedBooksView()
        .environmentObject(BookViewModel())
}
