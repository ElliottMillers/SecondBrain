//
//  TodoItemViewModel.swift
//  SecondBrain
//
//  Created by Elliott on 23.12.2024.
//
import Foundation
import Foundation

class ToDoCellViewModel: ObservableObject, Identifiable {
    @Published var item: ToDoItemModel
    
    init(item: ToDoItemModel) {
        self.item = item
    }
    
    func toggleDone() {
        item.isDone.toggle()
    }
}
