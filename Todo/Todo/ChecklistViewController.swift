//
//  ViewController.swift
//  Todo
//
//  Created by Marvin Nikijuluw on 8/9/19.
//  Copyright © 2019 Marvin Nikijuluw. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController, ItemDetailViewControllerDelegate {
    
    //MARK:- Add item viewcontroller delegates
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: TodoItem) {
        let newRowIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        
        tableView.insertRows(at: indexPaths, with: .automatic)
        navigationController?.popViewController(animated: true)
        
        saveTodoItems()
    }
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: TodoItem) {
        if let index = items.firstIndex(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            if let cell = tableView.cellForRow(at: indexPath) {
                configureText(for: cell, with: item)
            }
        }
        navigationController?.popViewController(animated: true)
        saveTodoItems()
    }
    
    
    //MARK:- Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any? ) {
        if segue.identifier == "AddItem" {
            let controller = segue.destination as! ItemDetailViewController
            
            controller.delegate = self
        } else if segue.identifier == "EditItem" {
            let controller = segue.destination as! ItemDetailViewController
            controller.delegate = self
            
            if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                controller.itemToEdit = items[indexPath.row]
            }
        }
    }
    
    
    var items = [TodoItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTodoItems()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
//        
//        // Add the following lines
//        let item1 = TodoItem()
//        item1.text = "Walk the dog"
//        items.append(item1)
//        
//        let item2 = TodoItem()
//        item2.text = "Walk the dog 2"
//        items.append(item2)
//        
//        let item3 = TodoItem()
//        item3.text = "Walk the dog 3"
//        items.append(item3)
//        
//        let item4 = TodoItem()
//        item4.text = "Walk the dog 4"
//        items.append(item4)
//        
//        let item5 = TodoItem()
//        item5.text = "Walk the dog 5"
//        items.append(item5)
//        
//        print("Documents folder is \(documentsDirectory())")
//        print("Data file path is \(dataFilePath())")
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
        saveTodoItems()
    }
    
    func configureCheckMark(for cell: UITableViewCell, with item: TodoItem) {
        let label = cell.viewWithTag(1001) as! UILabel
        if item.checked {
            label.text = "√"
        } else {
            label.text = ""
        }
    }
    
    func configureText(for cell: UITableViewCell, with item: TodoItem) {
        let label = cell.viewWithTag(1000) as! UILabel
        label.text = item.text
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        saveTodoItems()
    }
    
    //MARK:- saving data
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Checklists.plist")
    }
    
    func saveTodoItems() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(items)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    func loadTodoItems() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([TodoItem].self, from: data)
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
    

}

