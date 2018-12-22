//
//  ViewController.swift
//  Reorder
//
//  Created by MAC on 22/12/18.
//  Copyright © 2018 cagdaseksi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var numbers = ["one", "two", "three", "four", "five", "six","seven","eigth","nine","ten"]
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var btnAction: UIBarButtonItem!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = numbers[indexPath.row]
        return cell!
    }
    
    //Allows reordering of cells
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool
    {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath)
    {
        let item = numbers[sourceIndexPath.row]
        numbers.remove(at: sourceIndexPath.row)
        numbers.insert(item, at: destinationIndexPath.row)
    }
    
    @IBAction func edit(_ sender: Any)
    {
        myTableView.isEditing = !myTableView.isEditing
        
        switch myTableView.isEditing {
        case true:
            btnAction.title = "done"
        case false:
            btnAction.title = "edit"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
