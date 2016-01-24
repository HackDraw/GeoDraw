//
//  InterfaceController.swift
//  GeoDraw WatchKit Extension
//
//  Created by Christopher Robert Philabaum on 1/22/16.
//  Copyright © 2016 HackDraw. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController {
    var is_running : Bool
    
    override init() {
        is_running = false
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBOutlet var big_button: WKInterfaceButton!
    @IBAction func big_button_press() {
        if is_running {
            is_running = false
            big_button.setBackgroundColor(UIColor.greenColor())
        } else {
            is_running = true
            big_button.setBackgroundColor(UIColor.redColor())
        }
    }
}
