//
//  SegmentedCircle.swift
//  FillCircle
//
//  Created by Jaden Nation on 5/30/23.
//

import SwiftUI

struct RunningSegment {
    var duration: Float
    var isBreak: Bool = false
}

struct SegmentedCircle: View {
    var runningSegments: [RunningSegment] = []
    private var totalDuration: Float {
        runningSegments.reduce(0, {$0 + $1.duration})
    }
    
    private func convertSegmentsToSlices() -> some View {
        var slices: [AnyView] = []
        for (x, segment) in runningSegments.enumerated() {
            let sumUsedPercentage = runningSegments[0..<x].reduce(0, {$0 + $1.duration}) / totalDuration
            let rotation = Angle(degrees: Double(360) * Double(sumUsedPercentage))
            let newSegment = Circle()
                .trim(from: 0, to: CGFloat(segment.duration / totalDuration))
                .stroke(segment.isBreak ? Color.orange : .yellow,
                        style: StrokeStyle(lineWidth: 30))
                .rotationEffect(Angle(degrees: 360 / -4) + rotation)
            slices.append(AnyView(newSegment))
        }
        return AnyView(ZStack {
            ForEach(0..<slices.count, id: \.self) { index in
                slices[index]
            }
        })
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.white.opacity(0.6), style: StrokeStyle(lineWidth: 30))
            convertSegmentsToSlices()
            
        }
        .padding(50)
    }
}

struct SegmentedCircle_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            SegmentedCircle(runningSegments: [
                RunningSegment(duration: 120),
                RunningSegment(duration: 120, isBreak: true),
                RunningSegment(duration: 240),
                RunningSegment(duration: 120, isBreak: true)
            ])
        }
    }
}
