//
//  BirthdayReminderApp.swift
//  BirthdayReminder
//
//  Created by MacBook Air on 30/04/24.
//

import SwiftUI
import SwiftData

@main
struct BirthdayReminderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
        }
    }
}
