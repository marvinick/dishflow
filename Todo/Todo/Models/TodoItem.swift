//
//  TodoItem.swift
//  Todo
//
//  Created by Marvin Nikijuluw on 8/10/19.
//  Copyright © 2019 Marvin Nikijuluw. All rights reserved.
//

import Foundation

class TodoItem: NSObject, Codable {
    var text = ""
    var checked = false
    var dueDate = Date()
    var shouldRemind = false
    var itemID = -1
    
    func toggleChecked() {
        checked = !checked
    }
    
    override init() {
        super.init()
        itemID = DataModel.nextChecklistItemID()
    }
}
