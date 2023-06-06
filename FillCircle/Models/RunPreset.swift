//
//  RunPreset.swift
//  FillCircle
//
//  Created by Jaden Nation on 6/6/23.
//

import Foundation

struct RunPreset: Identifiable {
    var id: UUID = UUID()  // fix this later for persistence
    var customName: String = ""
    var week: Int
    var day: Int
    var warmupTime: TimeInterval = 300
    var cooldownTime: TimeInterval = 300
    var segments: [RunningSegment]
    var title: String {
        return week > 0 ? "Week \(week)" : customName
    }
    
    var subtitle: String {
        return "Day \(day)"
    }
    
    init(customName: String = "", week: Int, day: Int, warmupTime: TimeInterval = 300, cooldownTime: TimeInterval = 300, segments: [RunningSegment]) {
        self.customName = customName
        self.week = week
        self.day = day
        self.warmupTime = warmupTime
        self.cooldownTime = cooldownTime
        var segments = segments
        if segments.count > 0 {
            if warmupTime > 0 {
                segments.insert(RunningSegment(duration: warmupTime, isBreak: true), at: 0)
            }
            if cooldownTime > 0 {
                segments.append(RunningSegment(duration: cooldownTime, isBreak: true))
            }
        }
        
        self.segments = segments
    }
}

struct RunPresetCollection: Identifiable {
    var id: UUID = UUID()
    var presets: [RunPreset]
}

let DefaultPresetCollection: [RunPresetCollection] = [
    RunPresetCollection(presets: [
        RunPreset(week: 1, day: 1, segments: [
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
        ]),
        RunPreset(week: 1, day: 2, segments: [
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
        ]),
        RunPreset(week: 1, day: 3, segments: [
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 60),
            RunningSegment(duration: 90, isBreak: true),
        ]),
        RunPreset(week: 2, day: 1, segments: [
            RunningSegment(duration: 90),
            RunningSegment(duration: 120, isBreak: true),
            RunningSegment(duration: 90),
            RunningSegment(duration: 120, isBreak: true),
            RunningSegment(duration: 90),
            RunningSegment(duration: 120, isBreak: true),
            RunningSegment(duration: 90),
            RunningSegment(duration: 120, isBreak: true),
        ]),
        RunPreset(week: 2, day: 2, segments: [
            RunningSegment(duration: 90),
            RunningSegment(duration: 120, isBreak: true),
            RunningSegment(duration: 90),
            RunningSegment(duration: 120, isBreak: true),
            RunningSegment(duration: 90),
            RunningSegment(duration: 120, isBreak: true),
            RunningSegment(duration: 90),
            RunningSegment(duration: 120, isBreak: true),
        ]),
        RunPreset(week: 2, day: 3, segments: [
            RunningSegment(duration: 90),
            RunningSegment(duration: 120, isBreak: true),
            RunningSegment(duration: 90),
            RunningSegment(duration: 120, isBreak: true),
            RunningSegment(duration: 90),
            RunningSegment(duration: 120, isBreak: true),
            RunningSegment(duration: 90),
            RunningSegment(duration: 120, isBreak: true),
        ]),
    ])
    
]
