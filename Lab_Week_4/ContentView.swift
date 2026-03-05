//
//  ContentView.swift
//  Lab_Week_4
//
//  Created by Jason TIo on 05/03/26.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var authVM = AuthViewModel()
    @StateObject private var bookVM = BookViewModel()
    
    var body: some View {
        Group {
            if authVM.isLoggedIn {
                MainTabView()
                    .environmentObject(authVM)
                    .environmentObject(bookVM)
            } else {
                LoginView()
                    .environmentObject(authVM)
            }
        }
        .animation(.easeInOut, value: authVM.isLoggedIn)
    }
}

#Preview {
    ContentView()
}
