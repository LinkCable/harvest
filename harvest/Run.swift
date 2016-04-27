//
//  Run.swift
//  harvest
//
//  Created by Philippe Kimura-Thollander on 4/25/16.
//  Copyright © 2016 Philippe Kimura-Thollander. All rights reserved.
//

import UIKit

class Run: NSObject {
    var selectedName: String?
    var selectedDonor: String?
    var selectedRecipient: String?
    var selectedFood: String?
    
    override init() {
        selectedName = "Tap here"
        selectedDonor = "Tap here"
        selectedRecipient = "Tap here"
        selectedFood = "Tap here"
    }
}
