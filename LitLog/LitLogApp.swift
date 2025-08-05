//
//  LitLogApp.swift
//  LitLog
//
//  Created by shalinth adithyan on 25/07/25.
//
import SwiftData
import SwiftUI

@main
struct LitLogApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
