//
//  SelectionViewController.swift
//  harvest
//
//  Created by Philippe Kimura-Thollander on 4/18/16.
//  Copyright © 2016 Philippe Kimura-Thollander. All rights reserved.
//

import UIKit

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
        
        if category == "Names" {
            cellObjects = ["Kati Hunter", "Carolee Ver", "Maximo Duke", "Armando Jawad", "Millicent Timmins", "Mendy Bartolo", "Jessi Schutz", "Sima Eberly", "Charmaine Evatt", "Isidro Apolinar", "Mae Troy", "Bret Shurtz", "Mary Bevers", "Maryjane Kukowski"]
        }
        if category == "Donors" {
            cellObjects = ["7-11 Carle Place", "7-11 Great Neck", "7-11 Lawrence", "Auntie Anne's Pretzels (Mall Hick)", "Bagelman G C",]
        }
        if category == "Recipients" {
            cellObjects = ["Our Holy Redeemer", "Salvation Army Westbury", "Saint Raymond's Parish", "Hicksville Boy's and Girl's Club", "LI Teen Challenge"]
        }
        
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
    
    // Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
    // Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
