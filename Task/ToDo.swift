//
//  ToDo.swift
//  Task
//
//  Created by Cambrian on 2023-07-10.
//

import Foundation

class ToDo: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var title: String
    var desc: String?
    var dateCreated: Date
    var image: Data?
    var isComplete: Bool = false
    
    init(title: String) {
        self.title = title
        self.dateCreated = Date()
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(title, forKey: "title")
        coder.encode(desc, forKey: "desc")
        coder.encode(dateCreated, forKey: "dateCreated")
        coder.encode(image, forKey: "image")
        coder.encode(isComplete, forKey: "isComplete")
    }
    
    required init?(coder: NSCoder) {
        title = coder.decodeObject(forKey: "title") as! String
        desc = coder.decodeObject(forKey: "desc") as? String
//        dateCreated = coder.decodeObject(forKey: "dateCreated") as! Date
        dateCreated = Date()
        image = coder.decodeObject(forKey: "image") as? Data
        isComplete = coder.decodeBool(forKey: "isComplete")
        
        super.init()
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
