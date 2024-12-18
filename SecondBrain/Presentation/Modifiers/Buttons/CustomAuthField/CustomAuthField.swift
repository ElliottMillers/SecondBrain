//
//  CustomAuthField.swift
//  SecondBrain
//
//  Created by Elliott on 16.12.2024.
//

import SwiftUI

struct CustomAuthField: View {
    @Binding var text: String
    var placeholder: String
    var image: String
    var isSecure: Bool = false
    
    var body: some View {
        HStack {
            Image(systemName: image)
            if isSecure {
                SecureField(placeholder, text: $text)
            } else {
                TextField(placeholder, text: $text)
            }
        }
        .padding(.vertical, 6)
        .background(Divider(), alignment: .bottom)
        .padding(.bottom,8)
    }
}
