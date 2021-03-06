//
//  ArrivedViewController.swift
//  harvest
//
//  Created by Philippe Kimura-Thollander on 4/20/16.
//  Copyright © 2016 Philippe Kimura-Thollander. All rights reserved.
//

import UIKit
import SwiftSignatureView

class ArrivedViewController: UIViewController {

    @IBOutlet weak var agencySignatureView: SwiftSignatureView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var time: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true;

        // Do any additional setup after loading the view.
    
        timeLabel.text = time
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onReset(sender: AnyObject) {
        if (agencySignatureView.signature == nil) {
                let alert = UIAlertController(title: "Error", message: "Agency signature required", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
        }
        else{
            Run.sharedInstance.recipientSignature = agencySignatureView.signature
            Run.sharedInstance.selectedDonor = "Tap here"
            Run.sharedInstance.selectedRecipient = "Tap here"
            Run.sharedInstance.selectedFood = "Tap here"
            performSegueWithIdentifier("reset", sender: sender)
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
