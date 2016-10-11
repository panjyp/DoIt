//
//  TasksViewController.swift
//  DoIt
//
//  Created by Jeff Pan on 10/10/16.
//  Copyright © 2016 Jeff Pan. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var tasklist :[Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tasklist = makeTasks()

        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasklist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let task = tasklist[indexPath.row]
        
        if task.important {
            cell.textLabel?.text = "❗️\(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        return cell
    }
    
    func makeTasks() -> [Task] {
        let task1 = Task()
        
        task1.important = false
        task1.name = "Learn Swift"
        
        let task2 = Task()
        
        task2.important = true
        task2.name = "Do AIF form"
        let task3 = Task()
        
        task3.important = true
        task3.name = "Feed Walker"
        let task4 = Task()
        
        task4.important = false
        task4.name = "Get Dinner"
        
        return [task1, task2, task3, task4]
    }
    
    @IBAction func plusPressed(_ sender: AnyObject) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! CreateTaskViewController
        nextVC.previousVC = self
    }
}

