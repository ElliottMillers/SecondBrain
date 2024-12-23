//
//  TodoItemView.swift
//  SecondBrain
//
//  Created by Elliott on 23.12.2024.
//

import SwiftUI

struct TodoItemView: View {
    let item: ToDoItemModel
    @StateObject private var viewModel = ToDoItemViewModel()
    
    var body: some View {
        HStack {
            
            Image(systemName: item.isDone ? "checkmark.square" : "square")
            
            Text(item.title)
                .font(.headline)
                .bold()
            
            Spacer()
            
            Text(viewModel.dueDateString(item: item))
                .font(.footnote)
        }
        .padding(.horizontal, 20)
    }
}

