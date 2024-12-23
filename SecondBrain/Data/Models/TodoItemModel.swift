//
//  TodoModel.swift
//  SecondBrain
//
//  Created by Elliott on 23.12.2024.
//

import Foundation
import FirebaseFirestore

struct ToDoItemModel: Codable, Identifiable {
    @DocumentID var id: String?
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
}


