//
//  UserModel.swift
//  SecondBrain
//
//  Created by Elliott on 18.12.2024.
//

import Foundation

struct UserModel: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval 
}
