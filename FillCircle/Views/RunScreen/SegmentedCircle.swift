//
//  SegmentedCircle.swift
//  FillCircle
//
//  Created by Jaden Nation on 5/30/23.
//

import SwiftUI

struct SegmentedCircle: View {
    var lineWidth: CGFloat = 30
    var preset: RunPreset
    
    private func convertSegmentsToSlices() -> some View {
        let runningSegments = preset.segments.filter({!($0.isCooldown) && !($0.isWarmup)})
        let runningTime = runningSegments.reduce(0, {$0 + $1.duration})
        var slices: [AnyView] = []
        for (x, segment) in runningSegments.enumerated() {
            let sumUsedPercentage = runningSegments[0..<x].reduce(0, {$0 + $1.duration}) / runningTime
            let rotation = Double(360) * Double(sumUsedPercentage)
            let newSegment = Circle()
                .trim(from: 0, to: CGFloat(segment.duration / runningTime))
                .stroke(segment.isBreak ? Color.orange : .yellow,
                        style: StrokeStyle(lineWidth: lineWidth))
                .rotationEffect(Angle(degrees: -90 + rotation))
            slices.append(AnyView(newSegment))
        }
        return AnyView(ZStack {
            ForEach(0..<slices.count, id: \.self) { index in
                slices[index]
            }
        })
    }
    
    var body: some View {
            Circle()
                .stroke(Color.white.opacity(0.6), style: StrokeStyle(lineWidth: lineWidth))
            convertSegmentsToSlices()
    }
}

struct SegmentedCircle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            SegmentedCircle(preset: DefaultPresetCollection[1].presets[1])
            .padding()
        }
    }
}
