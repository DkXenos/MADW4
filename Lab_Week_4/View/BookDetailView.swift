//
//  BookDetailView.swift
//  Lab_Week_4
//
//  Created by Jason TIo on 05/03/26.
//

import SwiftUI

struct BookDetailView: View {
    let book: Book
    @EnvironmentObject var bookVM: BookViewModel
    
    var isSaved: Bool {
        bookVM.isSaved(book)
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Book Cover
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemGray6))
                    .frame(width: 180, height: 240)
                    .overlay(
                        Image(systemName: book.icon)
                            .font(.system(size: 60))
                            .foregroundColor(.black)
                    )
                    .padding(.top, 20)
                
                // Book Title
                Text(book.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                // Book Author
                Text(book.author)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                // Save / Unsave Button
                Button(action: {
                    bookVM.toggleSave(for: book)
                }) {
                    HStack {
                        Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                        Text(isSaved ? "Saved" : "Save Book")
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(isSaved ? .white : .black)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(isSaved ? Color.black : Color(.systemGray6))
                    .cornerRadius(10)
                }
                .padding(.horizontal)
                
                // Description
                VStack(alignment: .leading, spacing: 8) {
                    Text("Description")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(book.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineSpacing(4)
                }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
        }
        .navigationTitle("Book Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        BookDetailView(book: Book(
            title: "The Swift Programming Language",
            author: "Apple",
            icon: "swift",
            description: "The authoritative reference for Swift."
        ))
        .environmentObject(BookViewModel())
    }
}
