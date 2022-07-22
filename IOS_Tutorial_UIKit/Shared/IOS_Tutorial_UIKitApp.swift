//
//  IOS_Tutorial_UIKitApp.swift
//  Shared
//
//  Created by tiennv2 on 22/07/2022.
//

import SwiftUI

@main
struct IOS_Tutorial_UIKitApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
