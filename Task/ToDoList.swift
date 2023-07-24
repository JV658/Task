//
//  ToDoList.swift
//  Task
//
//  Created by Cambrian on 2023-07-10.
//

import Foundation

class ToDoList {
    var list = [ToDo]()
    
    private var templates = ["take the dog for a walk",
                             "do homework",
                             "clean kitchen",
                             "cut grass",
                             "grocery shopping",
                             "fix dryer vent",
                             "watch TV",
                             "complete side projects",
                             "pressure wash cars"]
    
    init(_ count: Int){
        for _ in 1...count {
            let index = Int.random(in: 0..<templates.count)
            let title = templates[index]
            addTodo(title: title)
        }
    }
    
    func addTodo(title: String){
        let newTodo = ToDo(title: title)
        list.append(newTodo)
    }
    
    func deleteTodo(indexPath: IndexPath){
        let index = indexPath.row
        
        list.remove(at: index)
    }
    
    func moveTodo(from: IndexPath, to: IndexPath){
        let fromIndex = from.row
        let temp = list[fromIndex]
        list.remove(at: fromIndex)
        let toIndex = to.row
        list.insert(temp, at: toIndex)
    }
}
