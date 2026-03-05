//
//  AuthViewModel.swift
//  Lab_Week_4
//
//  Created by Jason TIo on 05/03/26.
//

import SwiftUI
import Combine

class AuthViewModel: ObservableObject {
    @Published var isLoggedIn: Bool = false
    @Published var username: String = ""
    @Published var fullName: String = ""
    @Published var email: String = ""
    
    func login(username: String, password: String) {
        self.username = username
        self.isLoggedIn = true
    }
    
    func register(fullName: String, email: String, password: String) {
        self.fullName = fullName
        self.email = email
        self.username = email
        self.isLoggedIn = true
    }
    
    func logout() {
        self.isLoggedIn = false
        self.username = ""
        self.fullName = ""
        self.email = ""
    }
}
