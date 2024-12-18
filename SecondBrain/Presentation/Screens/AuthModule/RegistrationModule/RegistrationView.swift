//
//  RegistrationView.swift
//  SecondBrain
//
//  Created by Elliott on 16.12.2024.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()

    var body: some View {
        VStack(spacing: 10){
            VStack(alignment: .leading, spacing: 8){
                Text("Create Your Profile")
                    .font(.system(size: 25, weight: .medium))
                Text("Let me know about you!")
            }
            .padding(.top, 20)
            .padding()
            VStack{
                CustomAuthField(text: $viewModel.name, placeholder: "Name", image: "person")
                CustomAuthField(text: $viewModel.email, placeholder: "Email", image: "envelope")
                CustomAuthField(text: $viewModel.password, placeholder: "Password", image: "lock", isSecure: true)
                CustomAuthField(text: $viewModel.confirmPassword, placeholder: "Confirm Password", image: "lock", isSecure: true)
                
                CustomAuthButton(label: "Create an Account!") {
                    viewModel.register()
                }
                .padding(.top, 30)
            }
            .padding()
        }
    }
}

#Preview {
    RegistrationView()
}
