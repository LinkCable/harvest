//
//  ViewController.swift
//  harvest
//
//  Created by Philippe Kimura-Thollander on 4/18/16.
//  Copyright © 2016 Philippe Kimura-Thollander. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    var run: Run = Run()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.hidesBackButton = true;

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func unwindToSegue (segue : UIStoryboardSegue) {
        print(segue)
        if(segue.sourceViewController.isKindOfClass(SelectionViewController))
        {
            let view2 = segue.sourceViewController as! SelectionViewController
            if (view2.category == "Names"){
                self.run.selectedName = view2.selected
            }
            if (view2.category == "Donors"){
                self.run.selectedDonor = view2.selected
            }
            if (view2.category == "Recipients"){
                self.run.selectedRecipient = view2.selected
            }
            if (view2.category == "Items") {
                self.run.selectedFood = view2.selected
            }
        }
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cell = sender as? PickingCell{
            if (cell.selection == "Name"){
                let secondViewController = segue.destinationViewController as! SelectionViewController
                secondViewController.category = "Names"
            }
            if (cell.selection == "Donor"){
                let secondViewController = segue.destinationViewController as! SelectionViewController
                secondViewController.category = "Donors"
            }
            if (cell.selection == "Recipient"){
                let secondViewController = segue.destinationViewController as! SelectionViewController
                secondViewController.category = "Recipients"
            }
            if (cell.selection == "Carrying"){
                let secondViewController = segue.destinationViewController as! SelectionViewController
                secondViewController.category = "Items"
            }
        }
    }
    
    
    @IBAction func onStart(sender: AnyObject) {
        if (run.selectedName == "Tap here" || run.selectedFood == "Tap here" || run.selectedDonor == "Tap here" ||  run.selectedRecipient == "Tap here") {
            let alert = UIAlertController(title: "Error", message: "Please fill out all fields", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else{
            self.performSegueWithIdentifier("start", sender: sender)
        }
    }
}

