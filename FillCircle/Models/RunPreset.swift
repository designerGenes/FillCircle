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
    var segments: [RunningSegment]
    
    var runningSegments: [RunningSegment] {
        return segments.filter({!($0.isBreak) && !($0.isCooldown)})
    }
    
    var warmupTime: TimeInterval {
        return segments.filter({$0.isWarmup}).reduce(0, {$0 + $1.duration})
    }
    
    var cooldownTime: TimeInterval {
        return segments.filter({$0.isCooldown}).reduce(0, {$0 + $1.duration})
    }
    
    var runningTime: TimeInterval {
        // all time spent walking or running, except for warmup and cooldown
        return runningSegments.reduce(0, {$0 + $1.duration})
    }
    var breakTime: TimeInterval {
        // all time spent walking, except for warmup and cooldown
        return segments.filter({$0.isBreak}).reduce(0, {$0 + $1.duration})
    }
    
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
        var segments = segments
        if segments.count > 0 {
            if warmupTime > 0 {
                segments.insert(RunningSegment(duration: warmupTime, isWarmup: true), at: 0)
            }
            if cooldownTime > 0 {
                segments.append(RunningSegment(duration: cooldownTime, isCooldown: true))
            }
        }
        
        self.segments = segments
    }
}

struct RunPresetCollection: Identifiable {
    var id: UUID = UUID()
    var presets: [RunPreset]
}
