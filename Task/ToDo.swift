//
//  ToDo.swift
//  Task
//
//  Created by Cambrian on 2023-07-10.
//

import Foundation

class ToDo: NSObject, NSCoding {

    
    var title: String
    var desc: String?
    var dateCreated: Date
    var image: Data?
    var isComplete: Bool = false
    
    init(title: String) {
        self.title = title
        self.dateCreated = Date()
    }
    
    func setDescription(_ desc: String){
        self.desc = desc
    }
    
    func setImage(_ image: Data){
        self.image = image
    }
    
    func completeToDo(){
        isComplete = true
    }
}
