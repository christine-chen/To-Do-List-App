//
//  ViewController.swift
//  ToDoList
//
//  Created by Christine Chen on 2/23/16.
//  Copyright © 2016 Christine Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var toDoItem: ToDoItem?
    
    @IBOutlet var textFieldForNewToDo: UITextField!
    @IBOutlet var saveNewItem: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if sender as? NSObject != saveNewItem {
            return
        }
        if ((textFieldForNewToDo.text?.isEmpty) != nil) {
            toDoItem = ToDoItem(name: textFieldForNewToDo.text!)
        }
    }

}

