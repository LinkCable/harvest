//
//  TransitViewController.swift
//  harvest
//
//  Created by Philippe Kimura-Thollander on 4/20/16.
//  Copyright © 2016 Philippe Kimura-Thollander. All rights reserved.
//

import UIKit

class TransitViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    var startTime = NSTimeInterval()
    var timer = NSTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true;
    }

    override func viewDidAppear(animated: Bool) {
        let aSelector : Selector = #selector(TransitViewController.updateTime)
        timer = NSTimer.scheduledTimerWithTimeInterval(0.01, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = NSDate.timeIntervalSinceReferenceDate()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTime() {
        
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        
        //Find the difference between current time and start time
        var elapsedTime: NSTimeInterval = currentTime - startTime
        
        //calculate the hours in elapsed time
        let hours = UInt8(elapsedTime / 3600)
        elapsedTime -= (NSTimeInterval(hours) * 3600)
        
        //calculate the minutes in elapsed time
        let minutes = UInt8(elapsedTime / 60)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        //calculate the seconds in elapsed time
        let seconds = UInt8(elapsedTime)
        elapsedTime -= NSTimeInterval(seconds)
        
        //find out the fraction of milliseconds to be displayed
        
        //add the leading zero for minutes, seconds and millseconds and store them as string constants
        let strHours = String(format: "%02d", hours)
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        
        //concatenate hours, minutes and seconds as assign it to the UILabel
        timeLabel.text = "\(strHours):\(strMinutes):\(strSeconds)"
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

    @IBAction func onArrive(sender: AnyObject) {
        timer.invalidate()
        self.performSegueWithIdentifier("arrive", sender: sender)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "arrive" {
            let secondViewController = segue.destinationViewController as! ArrivedViewController
            secondViewController.time = timeLabel.text
        }
    }
}
