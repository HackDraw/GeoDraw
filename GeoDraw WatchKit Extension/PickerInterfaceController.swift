//
//  PickerInterfaceController.swift
//  GeoDraw
//
//  Created by OtherPlayers on 1/23/16.
//  Copyright © 2016 HackDraw. All rights reserved.
//

import WatchKit
import Foundation


class PickerInterfaceController: WKInterfaceController {
    @IBOutlet var red_picker: WKInterfacePicker!
    @IBOutlet var green_picker: WKInterfacePicker!
    @IBOutlet var blue_picker: WKInterfacePicker!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var color_vals = [WKPickerItem]()
        for n in 0...255 {
            let num = WKPickerItem()
            num.title = String(n)
            color_vals.append(num)
        }
        red_picker.setItems(color_vals)
        green_picker.setItems(color_vals)
        blue_picker.setItems(color_vals)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
