//
//  ContentView.swift
//  SecondBrain
//
//  Created by Elliott on 16.12.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignIn, !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }
    
    @ViewBuilder
    var accountView: some View {
        TabView {
            TodoListView()
                .tabItem{
                    Image(systemName: "checkmark")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                }
            }
    }
}

#Preview {
    MainView()
}
