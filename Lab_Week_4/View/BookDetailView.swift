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
            VStack(spacing: 16) {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.systemGray6))
                    .frame(width: 220, height: 300)
                    .overlay(
                        Image(systemName: book.icon)
                            .font(.system(size: 80))
                            .foregroundColor(.black)
                    )
                    .padding(.top, 30)
                
                Text(book.title)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text(book.author)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                HStack(spacing: 4) {
                    Image(systemName: "doc.text")
                        .font(.caption)
                        .foregroundColor(.gray)
                    Text("\(book.pages) pages")
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Button(action: {
                    bookVM.toggleSave(for: book)
                }) {
                    HStack(spacing: 8) {
                        Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                        Text(isSaved ? "Saved" : "Save")
                    }
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(12)
                }
                .padding(.horizontal, 24)
                .padding(.top, 8)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("Synopsis")
                        .font(.headline)
                        .fontWeight(.bold)
                    
                    Text(book.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .lineSpacing(4)
                }
                .padding(.horizontal, 24)
                .padding(.top, 8)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .frame(height: 40)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        BookDetailView(book: Book(
            title: "The Swift Programming Language",
            author: "Apple",
            icon: "swift",
            description: "The official guide to Swift. A must-read for iOS developers.",
            pages: 1000
        ))
        .environmentObject(BookViewModel())
    }
}
