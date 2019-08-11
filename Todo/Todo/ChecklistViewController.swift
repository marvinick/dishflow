//
//  ViewController.swift
//  Todo
//
//  Created by Marvin Nikijuluw on 8/9/19.
//  Copyright © 2019 Marvin Nikijuluw. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items = [TodoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Add the following lines
        let item1 = TodoItem()
        item1.text = "Walk the dog"
        items.append(item1)
        
        let item2 = TodoItem()
        item2.text = "Walk the dog 2"
        items.append(item2)
        
        let item3 = TodoItem()
        item3.text = "Walk the dog 3"
        items.append(item3)
        
        let item4 = TodoItem()
        item4.text = "Walk the dog 4"
        items.append(item4)
        
        let item5 = TodoItem()
        item5.text = "Walk the dog 5"
        items.append(item5)
    }
    
    //MARK:- Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let item = items[indexPath.row]
        
        configureText(for: cell, with: item)
        
        configureCheckMark(for: cell, with: item)
        
        return cell
    }
    
    // MARK:- Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            
            let item = items[indexPath.row]
            item.toggleChecked()
            configureCheckMark(for: cell, with: item)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func configureCheckMark(for cell: UITableViewCell, with item: TodoItem) {
        
        
        if item.checked {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: TodoItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    @IBAction func addItem() {
        let newRowIndex = items.count
        
        let item = TodoItem()
        item.text = "I am a new row"
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
    }

}

