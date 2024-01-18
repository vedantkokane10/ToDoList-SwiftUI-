//
//  NewItemView.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItermPresented : Bool // it is used to close the view after save is clicked
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top,50)
            Form{
                // title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                // Due Date
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(.graphical)
                // Button
                Button{
                    if viewModel.canSave{
                        viewModel.save()
                        newItermPresented = false
                    }
                    else{
                        viewModel.showAlert = true
                    }
                } label: {
                    Text("Save")
                }

            }.padding()
        }.alert(isPresented: $viewModel.showAlert) {
            Alert(title: Text("error"),message: Text("Please select appropriate name and select date apart from today"))
        }
    }
}

struct NewItemView_Previews: PreviewProvider {
    static var previews: some View {
        // binding set get used to dismiss the view
        NewItemView( newItermPresented: Binding(get: {
            return true
        }, set: { _ in
            
        }))
    }
}
