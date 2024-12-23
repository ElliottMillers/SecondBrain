//
//  TodoViewModel.swift
//  SecondBrain
//
//  Created by Elliott on 23.12.2024.
//

import Foundation
import FirebaseFirestore


class ToDoListViewModel: ObservableObject {
    @Published var items: [ToDoItemModel] = []
    
    private var db = Firestore.firestore()
    
    init() {
            // Підписуємося на зміни в колекції "tasks"
            db.collection("tasks")
                .order(by: "createdDate")
                .addSnapshotListener { [weak self] snapshot, error in
                    if let error = error {
                        print("Error getting tasks: \(error)")
                        return
                    }

                    // Оновлюємо список завдань при зміні в базі
                    self?.items = snapshot?.documents.compactMap { document in
                        try? document.data(as: ToDoItemModel.self)
                    } ?? []
                }
        }
    
    func fetchItems() {
        db.collection("tasks")
            .getDocuments { [weak self] (querySnapshot, error) in
                if let error = error {
                    print("Error getting documents: \(error)")
                    return
                }
                
                self?.items = querySnapshot?.documents.compactMap { document in
                    try? document.data(as: ToDoItemModel.self)
                } ?? []
            }
    }
    
    func addItem(title: String, dueDate: TimeInterval) {
        let newItem = ToDoItemModel(
            title: title,
            dueDate: dueDate,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        do {
            // Додаємо новий документ в колекцію "tasks"
            let _ = try db.collection("tasks").addDocument(from: newItem)
        } catch {
            print("Error adding document: \(error)")
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        for index in offsets {
            let item = items[index]
            if let itemId = item.id {
                db.collection("tasks").document(itemId).delete { error in
                    if let error = error {
                        print("Error deleting document: \(error)")
                    } else {
                        print("Document successfully deleted!")
                    }
                }
            } else {
                print("Error: Item ID is nil")
            }
        }
        items.remove(atOffsets: offsets)
    }
}
