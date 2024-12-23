//
//  ProfileView.swift
//  SecondBrain
//
//  Created by Elliott on 18.12.2024.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        ZStack {
            Color.customPinkColor.opacity(0.2).ignoresSafeArea(edges: .all)
            
            if let user = viewModel.user {
                profileLoginView(user: user)
            } else {
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                        .scaleEffect(1.8)
                        .padding()
                    Text("Loading User...")
                        .font(.headline)
                        .foregroundColor(.gray)
                }
            }
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profileLoginView(user: UserModel) -> some View {
        VStack {
            HStack {
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .padding(.horizontal, 10)
                
                VStack {
                    Text(user.name)
                        .bold()
                        .font(.title)
                    
                    Text("\(user.email)@gmail.com")
                        .bold()
                        .font(.title2)
                    
                    Text("Date of Joining: \(Date(timeIntervalSince1970: user.joined))")
                        .foregroundStyle(.gray)
                }
            }
            .padding(.top, 50)
            
            Spacer()
            
            Button {
                viewModel.signOut()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25.0)
                        .frame(width: 300, height: 50)
                    
                    Text("Log out")
                        .font(.title3)
                        .foregroundStyle(.red)
                }
            }
            .padding(.bottom, 30)
        }
    }
}

#Preview {
    ProfileView()
}
