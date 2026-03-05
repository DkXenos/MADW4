//
//  MainTabView.swift
//  Lab_Week_4
//
//  Created by Jason TIo on 05/03/26.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var bookVM: BookViewModel
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        TabView {
            HomeView()
                .environmentObject(bookVM)
                .environmentObject(authVM)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            
            ExploreView()
                .environmentObject(bookVM)
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Explore")
                }
            
            SavedBooksView()
                .environmentObject(bookVM)
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Saved")
                }
            
            ProfileView()
                .environmentObject(authVM)
                .environmentObject(bookVM)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView()
        .environmentObject(BookViewModel())
        .environmentObject(AuthViewModel())
}
