//
//  LocationWindow.swift
//  SurfBuddy
//
//  Created by John on 8/3/19.
//  Copyright © 2019 John. All rights reserved.
//

import Cocoa

protocol LocationWindowDelegate {
    func locationDidUpdate()
}

class LocationWindow: NSWindowController, NSWindowDelegate {
    var delegate: LocationWindowDelegate?
    var userInput = ""
    @IBOutlet weak var locationText: NSTextField!
    
    override var windowNibName : String! {
        return "LocationWindow"
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
        let defaults = UserDefaults.standard
        defaults.setValue(locationText.stringValue, forKey: "homeBeach")
        locationText.stringValue = userInput
    }
    func windowWillClose(_ notification: Notification) {
        let defaults = UserDefaults.standard
        defaults.setValue(locationText.stringValue, forKey: "homeBeach")
        delegate?.locationDidUpdate()
    }

}

        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    

