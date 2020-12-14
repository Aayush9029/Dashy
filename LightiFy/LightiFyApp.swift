//
//  LightiFyApp.swift
//  LightiFy
//
//  Created by Aayush Pokharel on 2020-12-13.
//

import SwiftUI

@main
struct LightiFyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(minWidth: 500, minHeight: 300)
        }
        // Hiding The Title Bar...
        .windowStyle(HiddenTitleBarWindowStyle())
    }
}

// Hiding Textfield Focus Ring...
extension NSTextField{
    open override var focusRingType: NSFocusRingType{
        get{.none}
        set{}
    }
}

