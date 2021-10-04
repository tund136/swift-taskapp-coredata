//
//  TaskAppCoreDataApp.swift
//  TaskAppCoreData
//
//  Created by Danh Tu on 05/10/2021.
//

import SwiftUI

@main
struct TaskAppCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
