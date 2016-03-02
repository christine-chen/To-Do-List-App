//
//  ToDoItem.swift
//  ToDoList
//
//  Created by Christine Chen on 2/23/16.
//  Copyright © 2016 Christine Chen. All rights reserved.
//

import UIKit

class ToDoItem: NSObject {
    var itemName: NSString = ""
    var completed: Bool = false
    var completedDate: NSDate = NSDate()
    
    init(name: String) {
        self.itemName = name
    }
    
//    // Mark: Types
//    
//    struct PropertyKey {
//        static let itemName: NSString = ""
//        static let completed: Bool = false
//        static let completedDate: NSDate = NSDate()
//    }

}
