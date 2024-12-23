//
//  TodoItemView.swift
//  SecondBrain
//
//  Created by Elliott on 23.12.2024.
//

import SwiftUI
import SwiftUI

struct ToDoCellView: View {
    @ObservedObject var viewModel: ToDoCellViewModel
    
    var body: some View {
        HStack {
            Button(action: {
                viewModel.toggleDone()
            }) {
                Image(systemName: viewModel.item.isDone ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .foregroundColor(viewModel.item.isDone ? .green : .gray)
            }
            
            VStack(alignment: .leading) {
                Text(viewModel.item.title)
                    .font(.headline)
                
                Text("Due: \(Date(timeIntervalSince1970: viewModel.item.dueDate), formatter: dateFormatter)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).fill(Color(.secondarySystemBackground)))
        .shadow(radius: 1)
    }
}

// Форматер для відображення дати
private let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    formatter.timeStyle = .short
    return formatter
}()
