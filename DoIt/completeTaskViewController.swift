//
//  completeTaskViewController.swift
//  DoIt
//
//  Created by Jeff Pan on 10/12/16.
//  Copyright © 2016 Jeff Pan. All rights reserved.
//

import UIKit

class completeTaskViewController: UIViewController {
    
    var task = Task()
    var previousVC = TasksViewController()

    @IBOutlet weak var labelTask: UILabel!
    
    @IBAction func completeButtonTapped(_ sender: AnyObject) {
        previousVC.tasklist.remove(at: previousVC.selectedIndex)
        previousVC.tableView.reloadData()
        navigationController!.popViewController(animated: true)

    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if task.important {
            labelTask.text = "❗️ \(task.name)"
            
        } else {
            labelTask.text = task.name
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
