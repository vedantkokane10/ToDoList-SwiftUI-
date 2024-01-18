//
//  User.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import Foundation
struct User:Codable{
    let id : String
    let name : String
    let email : String
    let joined: TimeInterval
}
