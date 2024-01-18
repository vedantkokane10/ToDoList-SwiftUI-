//
//  ToDoListItemsView.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import SwiftUI

struct ToDoListItemsView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item : ToDoListItem	
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(.gray)
                }
                    Spacer()
                    Button {
                        viewModel.toggleIsDone(item: item)
                    } label: {
                        Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                            .foregroundColor(.blue)
                    }
        }


        }
    }


struct ToDoListItemsView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemsView(item: .init(id: "123", title: "todo", dueDate: Date().timeIntervalSince1970, createDate: Date().timeIntervalSince1970, isDone: true))
    }
}
