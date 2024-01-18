//
//  RegisterViewViewModel.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class RegisterViewViewModel : ObservableObject{
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){
        
    }
    
    func register(){
        guard validate() else{
            return
        }
        
        // to create a new user
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else{
                return
            }
            
            self?.insertUserRecord(id: userId)
        }
        
        
    }
    
    
    
    private func insertUserRecord(id:String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        // firebase stores data in the form of collection we need to use firestore
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        // we used this asDictionary from Extensions file to convert the data in the form dictionary and store in collections of firebase
    }
    
    
    
    private func validate() -> Bool{
        // to check email password not empty and also it not include only whitespaces (trimmingCharacters)
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please enter a valid email"
            return false
        }
        // email should have @ and .com
        guard email.contains("@") && email.contains(".com") else{
            errorMessage = "Please enter a valid email"
            return false
        }
        
        // password must be greater than 6  
        guard password.count >= 6 else{
            errorMessage = "Please enter a password of length > 6"
            return false
        }
        return true
    }
}
