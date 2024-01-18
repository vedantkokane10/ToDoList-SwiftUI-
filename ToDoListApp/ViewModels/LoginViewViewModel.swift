//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import Foundation
import FirebaseAuth

class LoginViewModel : ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    init(){
        
    }
    
    func login(){
        
        guard validate() else {
            return
        }
        // try logging in as the credentials are valid
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    
    private func validate() -> Bool{
        // to check email password not empty and also it not include only whitespaces (trimmingCharacters)
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Please fill in all the fields"
            return false
        }
        print("Called")
        
        // email should have @ and .com
        guard email.contains("@") && email.contains(".com") else{
            errorMessage = "Please enter a valid email"
            return false
        }
        return true
    }
}
