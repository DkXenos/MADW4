//
//  Book.swift
//  Lab_Week_4
//
//  Created by Jason TIo on 05/03/26.
//

import Foundation

struct Book: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let author: String
    let icon: String
    let description: String
    var isSaved: Bool = false
}
