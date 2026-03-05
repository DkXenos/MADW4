//
//  BookViewModel.swift
//  Lab_Week_4
//
//  Created by Jason TIo on 05/03/26.
//

import SwiftUI
import Combine

class BookViewModel: ObservableObject {
    @Published var books: [Book] = [
        Book(
            title: "The Swift Programming Language",
            author: "Apple",
            icon: "swift",
            description: "The Swift Programming Language is the authoritative reference for Swift, offering a guided tour, a comprehensive guide, and a formal reference of the language. Written by Apple, this book provides everything you need to know about Swift, from basic concepts to advanced features. It covers topics such as closures, generics, protocols, and concurrency."
        ),
        Book(
            title: "1984",
            author: "George Orwell",
            icon: "eye",
            description: "1984 is a dystopian novel by English novelist George Orwell. It was published in 1949 as a warning about the menaces of totalitarianism. The novel is set in Airstrip One, a province of the superstate Oceania in a world of perpetual war, omnipresent government surveillance, and public manipulation."
        ),
        Book(
            title: "To Kill a Mockingbird",
            author: "Harper Lee",
            icon: "wand.and.stars",
            description: "To Kill a Mockingbird is a novel by the American author Harper Lee. It was published in 1960 and is widely read in high schools and middle schools in the United States. The novel explores themes of racial injustice, moral growth, and compassion in the American South during the 1930s."
        ),
        Book(
            title: "The Great Gatsby",
            author: "F. Scott Fitzgerald",
            icon: "sparkles",
            description: "The Great Gatsby is a 1925 novel by American writer F. Scott Fitzgerald. Set in the Jazz Age on Long Island, near New York City, the novel depicts first-person narrator Nick Carraway's interactions with mysterious millionaire Jay Gatsby and Gatsby's obsession to reunite with his former lover, Daisy Buchanan."
        ),
        Book(
            title: "Pride and Prejudice",
            author: "Jane Austen",
            icon: "heart.text.square",
            description: "Pride and Prejudice is a novel by Jane Austen, first published in 1813. The story follows the main character Elizabeth Bennet as she deals with issues of manners, upbringing, morality, education, and marriage in the society of the landed gentry of the British Regency."
        ),
        Book(
            title: "The Catcher in the Rye",
            author: "J.D. Salinger",
            icon: "leaf",
            description: "The Catcher in the Rye is a novel by J.D. Salinger, partially published in serial form in 1945-1946 and as a novel in 1951. It follows the experiences of Holden Caulfield, a teenager who has been expelled from prep school and is navigating New York City."
        )
    ]
    
    @Published var searchText: String = ""
    
    var filteredBooks: [Book] {
        if searchText.isEmpty {
            return books
        }
        return books.filter { book in
            book.title.localizedCaseInsensitiveContains(searchText) ||
            book.author.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var savedBooks: [Book] {
        books.filter { $0.isSaved }
    }
    
    func toggleSave(for book: Book) {
        if let index = books.firstIndex(where: { $0.id == book.id }) {
            books[index].isSaved.toggle()
        }
    }
    
    func removeSaved(for book: Book) {
        if let index = books.firstIndex(where: { $0.id == book.id }) {
            books[index].isSaved = false
        }
    }
    
    func isSaved(_ book: Book) -> Bool {
        books.first(where: { $0.id == book.id })?.isSaved ?? false
    }
}
