//
//  NewItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class NewItemViewViewModel : ObservableObject{
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert : Bool = false
    init(){}
    
    func save(){
        guard canSave else{
            return
        }
        // get current user id
        guard let uId  = Auth.auth().currentUser?.uid else{
            return
        }
        // create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
           id: newId,
           title: title,
           dueDate: dueDate.timeIntervalSince1970,
           createDate: Date().timeIntervalSince1970,
           isDone: false
        )
        
        
        // save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    }
    
    var canSave: Bool{
        // checking whether the not empty and also does not have whitespaces
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else{
            return false
        }
        
        // due date must be greater than today we are subtrating 86400 seconds i.e total seconds in a day
        guard dueDate >= Date().addingTimeInterval(-86400)else{
            return false
        }
        return true
    }
}
