//
//  ViewController.swift
//  harvest
//
//  Created by Philippe Kimura-Thollander on 4/18/16.
//  Copyright © 2016 Philippe Kimura-Thollander. All rights reserved.
//

import UIKit
import SwiftSignatureView

class MainViewController: UIViewController {

    @IBOutlet weak var donorSignatureView: SwiftSignatureView!
    
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
                Run.sharedInstance.selectedName = view2.selected
            }
            if (view2.category == "Donors"){
                Run.sharedInstance.selectedDonor = view2.selected
            }
            if (view2.category == "Recipients"){
                Run.sharedInstance.selectedRecipient = view2.selected
            }
            if (view2.category == "Items") {
                Run.sharedInstance.selectedFood = view2.selected
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
        if (Run.sharedInstance.selectedName == "Tap here" || Run.sharedInstance.selectedFood == "Tap here" || Run.sharedInstance.selectedDonor == "Tap here" ||  Run.sharedInstance.selectedRecipient == "Tap here") {
            let alert = UIAlertController(title: "Error", message: "Please fill out all fields", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else if (Run.sharedInstance.selectedDonor == Run.sharedInstance.selectedRecipient) {
            let alert = UIAlertController(title: "Error", message: "Donor can't be same as recipient", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)

        }
        else if(donorSignatureView.signature == nil) {
            let alert = UIAlertController(title: "Error", message: "Donor signature required", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else{
            Run.sharedInstance.donorSignature = donorSignatureView.signature
            self.performSegueWithIdentifier("start", sender: sender)
        }
    }
}

