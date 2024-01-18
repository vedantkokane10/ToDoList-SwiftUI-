//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import FirebaseFirestore
import Foundation

// view model for all items
class ToDoListViewViewModel : ObservableObject{
    @Published var showingNewItemView : Bool = false
    private let userId : String
    init(userId : String){
        self.userId = userId
    }
    
    func delete(id:String){
        // delete from users collection ->with user_id ->from todos collection -> with id
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
