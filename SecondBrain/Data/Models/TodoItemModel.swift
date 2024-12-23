//
//  TodoModel.swift
//  SecondBrain
//
//  Created by Elliott on 23.12.2024.
//

import Foundation

struct ToDoItemModel: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
}
