//
//  StatusMenuController.swift
//  SurfBuddy
//
//  Created by John on 8/3/19.
//  Copyright © 2019 John. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject, LocationWindowDelegate {
    
    var userInput = ""
    
    @IBOutlet weak var statusMenu: NSMenu!
    var locationWindow: LocationWindow!

    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)

    override func awakeFromNib() {
        if let statusItembutton = statusItem.button {
            statusItembutton.image = NSImage(named: "satusIcon")
        }
        statusItem.menu = statusMenu
        LocationInfo.newHomeBreak()
        locationWindow = LocationWindow()
        locationWindow.delegate = self
}
    func locationDidUpdate() {
        let defaults = UserDefaults.standard
        userInput = defaults.string(forKey: "homeBeach")!
        LocationInfo.findHomeBreak(userInput:userInput)
        
   }
    
    @IBAction func locationClicked(_ sender: NSMenuItem) {
    locationWindow.showWindow(nil)
    }
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.shared.terminate(self)
    }

}
