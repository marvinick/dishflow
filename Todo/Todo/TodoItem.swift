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
    
    func toggleChecked() {
        checked = !checked
    }
}
