//
//  ExploreView.swift
//  Lab_Week_4
//
//  Created by Jason TIo on 05/03/26.
//

import SwiftUI

struct ExploreView: View {
    @EnvironmentObject var bookVM: BookViewModel
    
    var body: some View {
        NavigationStack {
            List(bookVM.filteredBooks) { book in
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
                    }
                    .padding(.vertical, 4)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Explore")
            .searchable(text: $bookVM.searchText, prompt: "Search titles or authors")
        }
    }
}

#Preview {
    ExploreView()
        .environmentObject(BookViewModel())
}
