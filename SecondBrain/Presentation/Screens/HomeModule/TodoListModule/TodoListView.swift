//
//  TodoListView.swift
//  SecondBrain
//
//  Created by Elliott on 23.12.2024.
//

import SwiftUI
struct TodoListView: View {
    
    @StateObject private var viewModel = ToDoListViewModel()
    @State private var newTaskTitle: String = ""
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.blue)
                            .padding(.trailing, 5)
                        
                        TextField("New Task", text: $newTaskTitle)
                            .focused($isInputActive)
                            .onSubmit {
                                if !newTaskTitle.isEmpty {
                                    viewModel.addItem(title: newTaskTitle, dueDate: Date().addingTimeInterval(86400).timeIntervalSince1970)
                                    newTaskTitle = ""
                                }
                            }
                    }
                    .padding(.vertical, 5)
                    
                    // Список завдань
                    ForEach(viewModel.items) { item in
                        ToDoCellView(viewModel: ToDoCellViewModel(item: item))
                    }
                    .onDelete(perform: viewModel.deleteItem)
                }
                .listStyle(InsetGroupedListStyle())
            }
            .navigationTitle("To Do:")
        }
    }
}
