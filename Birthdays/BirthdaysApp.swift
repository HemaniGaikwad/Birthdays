//
//  BirthdaysApp.swift
//  Birthdays
//
//  Created by Hem Gai on 7/11/25.
//

import SwiftUI
import SwiftData

@main
struct BirthdaysApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
