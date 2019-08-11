//
//  AddItemTableViewController.swift
//  Todo
//
//  Created by Marvin Nikijuluw on 8/11/19.
//  Copyright © 2019 Marvin Nikijuluw. All rights reserved.
//

import UIKit

class AddItemTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //MARK:- Actions
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }

}
