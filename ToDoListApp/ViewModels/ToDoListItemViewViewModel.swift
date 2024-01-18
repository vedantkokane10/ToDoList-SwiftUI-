//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


// view model for a single item
class ToDoListItemViewViewModel : ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    init(){}
    
    func toggleIsDone(item : ToDoListItem){
        var itemCopy = item // create a copy of that
        itemCopy.setDone(!item.isDone) // this won't work on  original one as it is constant
        
        // we want userid to be current user's id
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }

}
