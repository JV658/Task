//
//  DetailViewController.swift
//  Task
//
//  Created by Cambrian on 2023-07-17.
//

import UIKit

class DetailViewController: UIViewController {

    var todo: ToDo?
    var indexPath: IndexPath?
    var tableView: UITableView!
    var todoList: ToDoList!
    
    // create outlet for text field
    @IBOutlet weak var titleTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard
            let title = todo?.title
        else { return }
        
        titleTextField.text = title
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let todo = todo,
           let indexPath = indexPath{
            todo.title = titleTextField.text!
            tableView.reloadRows(at: [indexPath], with: .automatic)
        } else {
            let row = todoList.list.count
            todoList.addTodo(title: titleTextField.text!)
            let indexPath = IndexPath(row: row, section: 0)
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
