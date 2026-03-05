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
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(bookVM.filteredBooks) { book in
                        NavigationLink(destination: BookDetailView(book: book).environmentObject(bookVM)) {
                            HStack(spacing: 14) {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color(.systemGray6))
                                    .frame(width: 56, height: 56)
                                    .overlay(
                                        Image(systemName: book.icon)
                                            .font(.title3)
                                            .foregroundColor(.black)
                                    )
                                
                                VStack(alignment: .leading, spacing: 4) {
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
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            .padding(14)
                            .background(Color(.systemGray6).opacity(0.5))
                            .cornerRadius(16)
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
            .navigationTitle("Explore")
            .searchable(text: $bookVM.searchText, prompt: "Search titles or authors")
        }
    }
}

#Preview {
    ExploreView()
        .environmentObject(BookViewModel())
}
