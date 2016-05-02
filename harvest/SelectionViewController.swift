//
//  SelectionViewController.swift
//  harvest
//
//  Created by Philippe Kimura-Thollander on 4/18/16.
//  Copyright © 2016 Philippe Kimura-Thollander. All rights reserved.
//

import UIKit
import Parse

class SelectionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var category: String?
    var cellObjects: [String]?
    var mainVC: UIViewController?
    var selected: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationItem.title = category
        cellObjects = []
        
        getObjects()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let cellObjects = cellObjects {
            return cellObjects.count
        } else {
            return 0
        }
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("SelectionCell", forIndexPath: indexPath)
        cell.textLabel?.text = cellObjects![indexPath.row] as String
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        selected = cellObjects![indexPath.row] as String
        performSegueWithIdentifier("return", sender: selected)
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let senderCell = sender as? UITableViewCell {
            selected = senderCell.textLabel?.text
        }
    }
    
    
    func getObjects() {
        
        var querySelector: String?
        
        if category == "Names" {
            querySelector = "Person"
        }
        if category == "Donors" || category == "Recipients" {
            querySelector = "Location"
        }
        if category == "Items" {
            querySelector = "Item"
        }
        
        var query = PFQuery(className:"\(querySelector!)")
        query.findObjectsInBackgroundWithBlock {
            (objects: [PFObject]?, error: NSError?) -> Void in
            
            if error == nil {
                // The find succeeded.
                print("Successfully retrieved \(objects!.count) scores.")
                
                if let objects = objects {
                    
                    if querySelector == "Person" {
                        for object in objects {
                            print(object["firstName"])
                            let firstName = object["firstName"] as! String
                            let lastName = object["lastName"] as! String
                            self.cellObjects?.append(firstName + " " + lastName)
                        }
                    }
                    
                    if querySelector == "Location" {
                        for object in objects {
                            let location = object["locationName"] as! String
                            self.cellObjects?.append(location)
                        }
                    }
                    
                    if querySelector == "Item" {
                        for object in objects {
                            let food = object["foodName"] as! String
                            self.cellObjects?.append(food)
                        }
                    }
                    
                    print(self.cellObjects)
                    self.tableView.reloadData()
                }
                
            } else {
                // Log details of the failure
                print("Error: \(error!) \(error!.userInfo)")
            }
        }
        
        
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
