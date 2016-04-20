//
//  ViewController.swift
//  harvest
//
//  Created by Philippe Kimura-Thollander on 4/18/16.
//  Copyright © 2016 Philippe Kimura-Thollander. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let cell = sender as? PickingCell{
            if (cell.selection == "Name"){
                let secondViewController = segue.destinationViewController as! SelectionViewController
                secondViewController.category = "Names"
            }
            if (cell.selection == "Route"){
                let secondViewController = segue.destinationViewController as! SelectionViewController
                secondViewController.category = "Routes"
            }
            if (cell.selection == "Carrying"){
                let secondViewController = segue.destinationViewController as! SelectionViewController
                secondViewController.category = "Items"
            }
        }
    }
}

