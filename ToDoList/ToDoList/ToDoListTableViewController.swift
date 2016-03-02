//
//  ToDoListTableViewController.swift
//  ToDoList
//
//  Created by Christine Chen on 2/23/16.
//  Copyright © 2016 Christine Chen. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {
    @IBOutlet var addButton: UIBarButtonItem!
    
    var listOfItems = [ToDoItem]()
    var completedItems = [ToDoItem]()
    var itemCompletedDates = [NSDate]()
    var keepToDoForAnotherHour = [ToDoItem]()
    var numberOfCompletedTasks = 0

    override func viewDidLoad() {
        super.viewDidLoad()
//        loadInitialData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }
    
    @IBAction func cancelAddItem(segue:UIStoryboardSegue) {
    }
    
    @IBAction func saveItem(segue:UIStoryboardSegue) {
        let source: ViewController = segue.sourceViewController as! ViewController
        let item: ToDoItem = source.toDoItem!
        if (item.itemName != "") {
            listOfItems.append(item)
        }
        tableView.reloadData()
    }
    
    @IBAction func returnFromStats(segue:UIStoryboardSegue) {
    }
    
//    func loadInitialData() {
//        let newItem: ToDoItem = ToDoItem(name: "fruit")
//        listOfItems.append(newItem)
//    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let CellIndentifier: NSString = "ListPrototypeCell"
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellIndentifier as String)! as UITableViewCell
        let item: ToDoItem = listOfItems[indexPath.row]
        cell.textLabel?.text = item.itemName as String
        if item.completed {
            cell.accessoryType = .Checkmark
        } else {
            cell.accessoryType = .None
        }
        var counter = 0;
        while completedItems.count > counter {
            let rn = NSDate()
            let today = itemCompletedDates[counter]
            let timeDistance = rn.timeIntervalSinceDate(today)
            if timeDistance > 3600*24 {
                keepToDoForAnotherHour.removeAll()
            }
            if timeDistance > 3600*23 {
                var anotherCounter = 0
                while listOfItems.count > 0 {
                    if completedItems[counter] == listOfItems[anotherCounter] {
                        listOfItems.removeAtIndex(anotherCounter)
                    }
                    anotherCounter += 1
                }
                itemCompletedDates.removeAtIndex(counter)
                completedItems.removeAtIndex(counter)
            }
            counter += 1
        }
        return cell
    }
    
    override func tableView(tableView: (UITableView!), didSelectRowAtIndexPath indexPath: (NSIndexPath!)) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let selectedItem: ToDoItem = listOfItems[indexPath.row]
        selectedItem.completed = !selectedItem.completed
        if selectedItem.completed == true {
            completedItems.append(selectedItem)
            keepToDoForAnotherHour.append(selectedItem)
            selectedItem.completedDate = NSDate.init()
            itemCompletedDates.append(selectedItem.completedDate)
        }
        for i in completedItems {
            if i == selectedItem && !i.completed {
                completedItems.removeAtIndex(indexPath.row)
                keepToDoForAnotherHour.removeAtIndex(indexPath.row)
                itemCompletedDates.removeAtIndex(indexPath.row)
                numberOfCompletedTasks -= 1
            }
        }
        numberOfCompletedTasks = keepToDoForAnotherHour.count
        tableView.reloadData()
    }
    

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            listOfItems.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
             //Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
         //Get the new view controller using segue.destinationViewController.
         //Pass the selected object to the new view controller.
        let navigationController = segue.destinationViewController as? UINavigationController
        let dailyStats = navigationController?.topViewController as? DailyStatsViewController
        dailyStats?.numberFromTableView = String(numberOfCompletedTasks)
    }
}
