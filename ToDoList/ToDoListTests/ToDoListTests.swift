//
//  ToDoListTests.swift
//  ToDoListTests
//
//  Created by Christine Chen on 2/23/16.
//  Copyright © 2016 Christine Chen. All rights reserved.
//

import XCTest
@testable import ToDoList

class ToDoListTests: XCTestCase {
    
    var vc : UITableViewController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        vc = UITableViewController()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testThatTaskModelExists() {
        XCTAssertNotNil(vc.listOfItems, "Tasks should not be nil")
    }
    
    func testThatWithin24HoursWorks() {
        var anHourAgo = NSDate(timeIntervalSinceNow: 3600*24)
        XCTAssertTrue(vc.isWithin24Hrs(anHourAgo), <#T##message: String##String#>)
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func randomFunction() {
        for (var i = 0; i < 9999999; i++) {
            
        }
        return
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
            self.randomFunction()
        }
    }
    
}
