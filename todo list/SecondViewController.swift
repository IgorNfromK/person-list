//
//  SecondViewController.swift
//  todo list
//
//  Created by Igor Nagaievskyi on 25/07/2019.
//  Copyright © 2019 Igor Nagaievskyi. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var item2AddField: UITextField!
    
    @IBAction func addTask(_ sender: Any) {
        
        let taskObject = UserDefaults.standard.object(forKey: "tasks")
        
        var tasks:[String]
        
        if let task = taskObject as? [String]{
            
            tasks = task
            
            tasks.append(item2AddField.text!)
            
            
            
        } else{
            
             tasks = [item2AddField.text!]
        }
        
        UserDefaults.standard.set(tasks, forKey: "tasks")
        
        item2AddField.text = ""
        
    }
    
    //hide keyboard when tapped off
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
    //hide keyboard when pressing 'return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        item2AddField.resignFirstResponder()
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

