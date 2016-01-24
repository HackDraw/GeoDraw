//
//  InterfaceController.swift
//  GeoDraw WatchKit Extension
//
//  Created by Christopher Robert Philabaum on 1/22/16.
//  Copyright © 2016 HackDraw. All rights reserved.
//

import WatchKit
import Foundation

class InterfaceController: WKInterfaceController, CLLocationManagerDelegate {
    var is_running : Bool
    let loc_manager = CLLocationManager()
    var update_timer = NSTimer()
    var saved_locations : [(lat :  Double, long : Double)] = []
    
    override init() {
        is_running = false
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        loc_manager.delegate = self
        loc_manager.distanceFilter = 10
        loc_manager.desiredAccuracy = kCLLocationAccuracyBest
        loc_manager.requestAlwaysAuthorization()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func locationManager(manager: CLLocationManager, let didUpdateLocations locations: [CLLocation]) {
        saved_locations += [(lat: locations.first!.coordinate.latitude, long: locations.first!.coordinate.latitude)]
    }
    
    func reset_timer(){
        let update_interval : NSTimeInterval = 5.0
        if update_timer.valid{update_timer.invalidate()}
        update_timer = NSTimer.scheduledTimerWithTimeInterval(update_interval, target: self, selector: "update_timer_end", userInfo: nil, repeats: true)
    }
    
    func update_timer_end(timer:NSTimer){
        loc_manager.requestLocation()
        reset_timer()
    }
    
    @IBOutlet var big_button: WKInterfaceButton!
    @IBAction func big_button_press() {
        if is_running {
            let auth_status = CLLocationManager.authorizationStatus()
            var allowed = false
            switch auth_status {
            case .NotDetermined:
                allowed = false
            case .Denied:
                allowed = false
            case .AuthorizedWhenInUse:
                allowed = true
            case .AuthorizedAlways:
                allowed = true
            default:
                allowed = false
            }
            if allowed {
                is_running = false
                big_button.setBackgroundColor(UIColor.greenColor())
                reset_timer()
            }
        } else {
            is_running = true
            big_button.setBackgroundColor(UIColor.redColor())
            loc_manager.stopUpdatingLocation()
            update_timer.invalidate()
            }
        }
    }
}
