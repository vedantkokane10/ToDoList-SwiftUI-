//
//  ToDoListItem.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 29/07/2023.
//

import Foundation
struct ToDoListItem : Identifiable,Codable{
    let id : String
    let title : String
    let dueDate : TimeInterval
    let createDate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state:Bool){
        isDone = state
    }
}
