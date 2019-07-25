//
//  FirstViewController.swift
//  todo list
//
//  Created by Igor Nagaievskyi on 25/07/2019.
//  Copyright © 2019 Igor Nagaievskyi. All rights reserved.
//

import UIKit


class FirstViewController: UIViewController,  UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var table: UITableView!
    

    
    

    
    var tasks:[String] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  =  UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        
        
       cell.textLabel?.text = tasks[indexPath.row]

        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        let taskObject = UserDefaults.standard.object(forKey: "tasks")
        
        if let task = taskObject as? [String]{
            
            tasks = task
            
        }
        
        table.reloadData()
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            let alert = UIAlertController(title: "", message: "Edit list of your Tasks", preferredStyle: .alert)
            
            alert.addTextField(configurationHandler: { (textField) in
                textField.text = self.tasks[indexPath.row]
                
             
                
            })
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                self.tasks[indexPath.row] = alert.textFields!.first!.text!
                UserDefaults.standard.set(self.tasks, forKey: "tasks")
                self.table.reloadData()
            
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: false)
        })
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete",  handler: { (action, indexPath) in
            self.tasks.remove(at: indexPath.row)
            tableView.reloadData()
        })
        
        return [deleteAction, editAction]
    
    }
}

