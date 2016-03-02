//
//  DailyStatsViewController.swift
//  ToDoList
//
//  Created by Christine Chen on 2/29/16.
//  Copyright © 2016 Christine Chen. All rights reserved.
//

import UIKit

class DailyStatsViewController: UIViewController {

    @IBOutlet var numOfToDosCompleted: UILabel!
    var numberFromTableView = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numOfToDosCompleted.text = numberFromTableView
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
