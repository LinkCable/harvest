//
//  TableViewController.swift
//  harvest
//
//  Created by Philippe Kimura-Thollander on 4/18/16.
//  Copyright © 2016 Philippe Kimura-Thollander. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    @IBOutlet weak var selectedNameLabel: UILabel!
    @IBOutlet weak var selectedDonorLabel: UILabel!
    @IBOutlet weak var selectedRecipientLabel: UILabel!
    @IBOutlet weak var selectedFoodLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        tableView.tableFooterView = UIView()
        tableView.scrollEnabled = false
        tableView.delegate = self
    }
    
    override func viewDidAppear(animated: Bool) {
        
        selectedNameLabel.text = Run.sharedInstance.selectedName
        selectedDonorLabel.text = Run.sharedInstance.selectedDonor
        selectedRecipientLabel.text = Run.sharedInstance.selectedRecipient
        selectedFoodLabel.text = Run.sharedInstance.selectedFood
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
        return 4
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as! PickingCell
        currentCell.selection = currentCell.textLabel?.text
        self.parentViewController?.performSegueWithIdentifier("select", sender: currentCell)
    }

}
