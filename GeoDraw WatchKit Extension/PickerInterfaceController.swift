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
    @IBOutlet var color_text: WKInterfaceLabel!
    
    var red_val : CGFloat = 1.0
    var green_val : CGFloat = 1.0
    var blue_val : CGFloat = 1.0

    @IBAction func red_val_click(value: Int) {
        let val = CGFloat(value)
        red_val = val / 255
        color_text.setTextColor(UIColor(red: red_val, green: green_val, blue: blue_val, alpha: 1.0))
    }
    @IBAction func green_val_click(value: Int) {
        let val = CGFloat(value)
        green_val = val / 255
        color_text.setTextColor(UIColor(red: red_val, green: green_val, blue: blue_val, alpha: 1.0))
    }
    @IBAction func blue_val_click(value: Int) {
        let val = CGFloat(value)
        blue_val = val / 255
        color_text.setTextColor(UIColor(red: red_val, green: green_val, blue: blue_val, alpha: 1.0))
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var color_vals = [WKPickerItem]()
        for n in 0...255 {
            let num = WKPickerItem()
            num.title = String(n)
            color_vals.append(num)
        }
        red_picker.setItems(color_vals)
        red_picker.setSelectedItemIndex(255)
        green_picker.setItems(color_vals)
        green_picker.setSelectedItemIndex(255)
        blue_picker.setItems(color_vals)
        blue_picker.setSelectedItemIndex(255)
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
