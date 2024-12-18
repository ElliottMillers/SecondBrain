//
//  CustomAuthButton.swift
//  SecondBrain
//
//  Created by Elliott on 16.12.2024.
//

import SwiftUI

struct CustomAuthButton: View {
    var label: String
    var iconName: String?
    var iconImage: Image?
    var action: () -> Void
    var body: some View {
        Button(action: action, label: {
            HStack{
                if let iconImage = iconImage {
                    iconImage
                        .resizable()
                        .frame(width: 20, height: 20)
                } else if let iconName = iconName {
                    Image(systemName: iconName)
                        .resizable()
                        .frame(width: 20, height: 20)
                }
                Text(label)
                    .bold()
                    .foregroundStyle(Color.black)
            }
        })
        .frame(maxWidth: .infinity)
        .padding(.vertical, 15)
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: .black, radius: 4, x: 0, y: 2)
    }
}
