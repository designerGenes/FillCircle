//
//  FillCircleApp.swift
//  FillCircle
//
//  Created by Jaden Nation on 5/30/23.
//

import SwiftUI

@main
struct FillCircleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(segments: [
                RunningSegment(duration: 120),
                RunningSegment(duration: 120, isBreak: true),
                RunningSegment(duration: 240),
                RunningSegment(duration: 120, isBreak: true)
            ])
        }
    }
}
