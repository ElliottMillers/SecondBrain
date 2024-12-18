//
//  LoginView.swift
//  SecondBrain
//
//  Created by Elliott on 16.12.2024.
//

import SwiftUI

struct LoginView: View {
    @State private var isSignup: Bool = false
    @StateObject var viewModel = LoginViewModel()
    var body: some View {
        Image("login")
            .resizable()
            .frame(width: 300, height: 300)
        VStack{
            Text("Login")
                .bold()
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 20)
            
            HStack{
                Image(systemName: "envelope")
                TextField("Email", text: $viewModel.email)
            }
            .padding(.vertical, 6)
            .background(Divider(), alignment: .bottom)
            .padding(.bottom, 8)
            
            HStack{
                Image(systemName: "lock")
                SecureField("Password", text: $viewModel.password)
            }
            .padding(.vertical, 6)
            .background(Divider(), alignment: .bottom)
            .padding(.bottom, 8)
            
            CustomAuthButton(label: "Log In", action: {
                viewModel.login()
            })
            .padding(.top, 20)
        }
        .padding()
        .padding(.bottom, 40)
        
        VStack{
            Text("Don't have account?")
                .font(.subheadline)
            
            CustomAuthButton(label: "Create an Account", action: {
                isSignup.toggle()
            })
            .padding()
            .padding(.bottom, 30)
        }
        .sheet(isPresented: $isSignup, content: {
            RegistrationView()
        })
        
    }
}

#Preview {
    LoginView()
}
