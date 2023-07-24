//
//  TodoTableViewController.swift
//  Task
//
//  Created by Cambrian on 2023-07-10.
//

import UIKit

class TodoTableViewController: UITableViewController {

//  var todoList = ToDoList(2)
    var todoList: ToDoList!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.leftBarButtonItem = self.editButtonItem
                
        print(#function)
        
        
        /// programatically adding views test
        
//        let frame1 = CGRect(x: 200, y: 150, width: 100, height: 100)
//        let view1 = UIView(frame: frame1)
//        view1.backgroundColor = .blue
//        view.addSubview(view1)
//
//        let frame2 = CGRect(x: 30, y: 30, width: 25, height: 25)
//        let view2 = UIView(frame: frame2)
//        view2.backgroundColor = .green
//        view1.addSubview(view2)
        
    }

//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        print(#function)
//        tableView.reloadData()
//    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return todoList.list.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)

        // Configure the cell...
        let row = indexPath.row
        
        let title = todoList.list[row].title
        
        cell.textLabel?.text = title

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            todoList.deleteTodo(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        todoList.moveTodo(from: fromIndexPath, to: to)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
        let dst = segue.destination as! DetailViewController
        dst.tableView = tableView
        dst.todoList = todoList
        
        
        if segue.identifier == "edit"
        {
            let indexPath = tableView.indexPathForSelectedRow!
            let row = indexPath.row
            dst.todo = todoList.list[row]
            dst.indexPath = indexPath
            
        }
        
        todoList.save()
    }
}
