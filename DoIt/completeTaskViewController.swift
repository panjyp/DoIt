//
//  completeTaskViewController.swift
//  DoIt
//
//  Created by Jeff Pan on 10/12/16.
//  Copyright © 2016 Jeff Pan. All rights reserved.
//

import UIKit

class completeTaskViewController: UIViewController {
    
    var task :Task? = nil

    @IBOutlet weak var labelTask: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if task!.important {
            labelTask.text = "❗️ \(task!.name!)"
            
        } else {
            labelTask.text = task!.name!
        }
        // Do any additional setup after loading the view.
    }

    @IBAction func completeButtonTapped(_ sender: AnyObject) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(task!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
        
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
