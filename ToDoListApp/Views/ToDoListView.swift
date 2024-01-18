//
//  ToDoListItemView.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import SwiftUI
import FirebaseFirestoreSwift


struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewViewModel
    @FirestoreQuery var items : [ToDoListItem]
    let userId : String
    init(userId : String){
         self.userId = userId
        // we are using _ because @ is convention @Firestore
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    
    }
    var body: some View {
        
        NavigationView {
            VStack{
                List(items){item in
                    ToDoListItemsView( item: item)
                        .swipeActions {
                            Button {
                                // delete
                                viewModel.delete(id: item.id)
                            } label: {
                                Text("Delete").foregroundColor(.red)
                            }.tint(.red) // to make delete red

                        }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    // action
                    viewModel.showingNewItemView = true
                    
                } label: {
                    
                    Image(systemName: "plus").foregroundColor(.black)
                }

            }.sheet(isPresented: $viewModel.showingNewItemView) {
                // if + is pressed then we will go to new view
                NewItemView(newItermPresented: $viewModel.showingNewItemView)
            }
        }
        
    }
    
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView(userId: "QSGdhdB7kSX4r2Gn5i7qM0JmWDj2")
    }
}
