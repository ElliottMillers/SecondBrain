//
//  RegistrationView.swift
//  SecondBrain
//
//  Created by Elliott on 16.12.2024.
//

import SwiftUI

struct RegistrationView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var name: String = ""
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
                CustomAuthField(text: $email, placeholder: "Name", image: "person")
                CustomAuthField(text: $email, placeholder: "Email", image: "envelope")
                CustomAuthField(text: $email, placeholder: "Password", image: "lock", isSecure: true)
                CustomAuthField(text: $email, placeholder: "Confirm Password", image: "lock", isSecure: true)
                
                CustomAuthButton(label: "Create an Account!") {
                    //code
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
