//
//  ViewController.swift
//  todoey
//
//  Created by Piotr Andrzejewski on 04/03/2019.
//  Copyright © 2019 Piotr Andrzejewski. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["itm 1", "item 2", "item 3" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath)!
        
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
        }
        else {
            cell.accessoryType = .checkmark
        }
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Add new item", message: nil, preferredStyle: .alert)
        var input : UITextField?
        alertController.addAction(UIAlertAction(title: "Save", style: .default, handler: { (alertAction) in
            if let inputValue = input?.text {
                self.itemArray.append(inputValue)
                self.tableView.reloadData()
            }
        }))
        alertController.addTextField { (textField) in
            textField.placeholder = "add list name"
            input = textField
        }
        present(alertController, animated: true)
    }
    
}

