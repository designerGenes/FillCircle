//
//  ContentView.swift
//  FillCircle
//
//  Created by Jaden Nation on 5/30/23.
//

import SwiftUI

struct ContentView: View {
    var segments: [RunningSegment] = []
    var lineWidth: CGFloat = 30.0

    var Background: some View {
        Color.blukraine()
    }
    
    var body: some View {
        ZStack {
            Background
            VStack {
                HStack {
                    Rectangle()
                        .foregroundColor(.black)
                        .overlay {
                            CountdownTimer(timerDuration: 150)
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
                .padding(50)
            }
        }
        .ignoresSafeArea()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(segments: [
            RunningSegment(duration: 120),
            RunningSegment(duration: 120, isBreak: true),
            RunningSegment(duration: 240),
            RunningSegment(duration: 120, isBreak: true)
        ], lineWidth: 30)
    }
}
