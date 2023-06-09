//
//  DefaultPresetCollection.swift
//  FillCircle
//
//  Created by Jaden Nation on 6/6/23.
//

import Foundation

let DefaultPresetCollection: [RunPresetCollection] = [
    RunPresetCollection(presets: [
        RunPreset(customName: "Custom", week: 0, day: 0, segments: []) // blank custom
    ]),
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
        RunPreset(week: 3, day: 1, segments: [
            RunningSegment(duration: 90),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 180),
            RunningSegment(duration: 180, isBreak: true),
            RunningSegment(duration: 90),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 180),
            RunningSegment(duration: 180, isBreak: true),
        ]),
        RunPreset(week: 3, day: 2, segments: [
            RunningSegment(duration: 90),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 180),
            RunningSegment(duration: 180, isBreak: true),
            RunningSegment(duration: 90),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 180),
            RunningSegment(duration: 180, isBreak: true),
        ]),
        RunPreset(week: 3, day: 3, segments: [
            RunningSegment(duration: 90),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 180),
            RunningSegment(duration: 180, isBreak: true),
            RunningSegment(duration: 90),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 180),
            RunningSegment(duration: 180, isBreak: true),
        ]),
        RunPreset(week: 4, day: 1, segments: [
            RunningSegment(duration: 180),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 300),
            RunningSegment(duration: 150, isBreak: true),
            RunningSegment(duration: 180),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 300),
        ]),
        RunPreset(week: 4, day: 2, segments: [
            RunningSegment(duration: 180),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 300),
            RunningSegment(duration: 150, isBreak: true),
            RunningSegment(duration: 180),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 300),
        ]),
        RunPreset(week: 4, day: 3, segments: [
            RunningSegment(duration: 180),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 300),
            RunningSegment(duration: 150, isBreak: true),
            RunningSegment(duration: 180),
            RunningSegment(duration: 90, isBreak: true),
            RunningSegment(duration: 300),
        ]),
        RunPreset(week: 5, day: 1, segments: [
            RunningSegment(duration: 300),
            RunningSegment(duration: 180, isBreak: true),
            RunningSegment(duration: 300),
            RunningSegment(duration: 180, isBreak: true),
            RunningSegment(duration: 300),
        ]),
        RunPreset(week: 5, day: 2, segments: [
            RunningSegment(duration: 480),
            RunningSegment(duration: 300, isBreak: true),
            RunningSegment(duration: 480),
        ]),
        RunPreset(week: 6, day: 1, segments: [
            RunningSegment(duration: 300),
            RunningSegment(duration: 180, isBreak: true),
            RunningSegment(duration: 480),
            RunningSegment(duration: 180, isBreak: true),
            RunningSegment(duration: 300),
        ]),
        RunPreset(week: 6, day: 2, segments: [
            RunningSegment(duration: 600),
            RunningSegment(duration: 180, isBreak: true),
            RunningSegment(duration: 600),
        ]),
        RunPreset(week: 6, day: 3, segments: [
            RunningSegment(duration: 1320),
        ]),
        RunPreset(week: 7, day: 1, segments: [
            RunningSegment(duration: 1500),
        ]),
        RunPreset(week: 7, day: 2, segments: [
            RunningSegment(duration: 1500),
        ]),
        RunPreset(week: 7, day: 3, segments: [
            RunningSegment(duration: 1500),
        ]),
        RunPreset(week: 8, day: 1, segments: [
            RunningSegment(duration: 1680),
        ]),
        RunPreset(week: 8, day: 2, segments: [
            RunningSegment(duration: 1680),
        ]),
        RunPreset(week: 8, day: 3, segments: [
            RunningSegment(duration: 1800),
        ]),
    ])
    
]
