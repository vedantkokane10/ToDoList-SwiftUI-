//
//  Extensions.swift
//  ToDoListApp
//
//  Created by Vedant Kokane on 04/08/2023.
//

import Foundation

extension Encodable{
    // this function will return us a dictionary
    func asDictionary() -> [String:Any]{
        guard let data = try? JSONEncoder().encode(self) else{
            return [:]
        }
        do{
            let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]
            return json ?? [:]
        }catch{
            return [:]
        }
        
    }
}
