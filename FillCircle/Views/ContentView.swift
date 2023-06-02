//
//  ContentView.swift
//  FillCircle
//
//  Created by Jaden Nation on 5/30/23.
//

import SwiftUI



struct ContentView: View {
    
    @State var percentFinished: Double = 0.0
    var countdownDuration: TimeInterval {
        return segments.reduce(0, { $0 + $1.duration})
    }
    @State var segments: [RunningSegment]
    var lineWidth: CGFloat = 30.0

    var Background: some View {
        Color.blukraine()
    }
    
    var Countdown: CountdownTimer {
        var out = CountdownTimer(timerDuration: 150)
        out.delegate = self
        return out
    }
    
    var body: some View {
        ZStack {
            Background
            VStack {
                HStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(15)
                        .overlay {
                            Countdown
                                .foregroundColor(.yellow)
                        }
                        .frame(width: 200, height: 50)
                }
                ZStack {
                    Circle() // background
                        .stroke(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: lineWidth))
                    SegmentedCircle(runningSegments: segments)
                    Circle()
                        .padding() // center
                }
                .rotationEffect(Angle(degrees: (360  * self.percentFinished)))
                .padding(50)
            }
        }
        .ignoresSafeArea()
    }
    
}

extension ContentView: CountdownTimerDelegate {
    // MARK: - CountdownTimerDelegate methods
    func didUpdate(timer: CountdownTimer, remainingDuration: Double) {
        self.percentFinished = remainingDuration / countdownDuration
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(segments: [
            RunningSegment(duration: 120),
            RunningSegment(duration: 120, isBreak: true),
            RunningSegment(duration: 240),
            RunningSegment(duration: 120, isBreak: true)
        ])
    }
}
