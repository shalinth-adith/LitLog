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
    @State private var showSplash = true

    var body: some Scene {
        WindowGroup {
                    if showSplash {
                        EntrySplashView {
                            showSplash = false
                        }
                    } else {
                        ContentView()
                    }
                }
                .modelContainer(for: Book.self)
            }
        }
