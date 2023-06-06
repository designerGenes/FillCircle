//
//  CountdownTimer.swift
//  FillCircle
//
//  Created by Jaden Nation on 5/31/23.
//

import SwiftUI

enum CountdownTimerMode: Int {
    case showRemainingSegmentDuration
    case showRemainingDuration
    case showSpentDuration
    
    static func values() -> [CountdownTimerMode] {
        return [.showRemainingSegmentDuration, .showRemainingDuration, .showSpentDuration]
    }
    
    func nextMode() -> CountdownTimerMode {
        let curVal = self.rawValue
        let allVals = CountdownTimerMode.values()
        if curVal == allVals.last?.rawValue {
            return allVals[0]
        }
        return allVals[curVal + 1]
    }
}

protocol CountdownTimerDelegate {
    func didUpdate(timer: CountdownTimer, remainingDuration: Double)
}

struct CountdownTimer: View {
    @State var segments: [RunningSegment]
    var timerTotalDuration: TimeInterval {
        return segments.reduce(0, {$0 + $1.duration})
    }
    @State var timerRemainingDuration: TimeInterval
    @State private var isTimerFinished: Bool = false
    @State private var isTimerRunning = false
    @State private var isTimerPaused = false
    @State private var timer: Timer?
    var delegate: CountdownTimerDelegate?
    @State var timerMode: CountdownTimerMode = .showRemainingSegmentDuration
    
    init(segments: [RunningSegment]) {
        self._segments = State(initialValue: segments)
        self._timerRemainingDuration = State(initialValue: segments.reduce(0, {$0 + $1.duration}))
    }
    
    var PlayStateButton: Image {
        let name = isTimerRunning ? "pause.rectangle.fill" : "play.square.fill"
        return Image(systemName: name)
    }
    
    var TimeDisplayModeButton: Image {
        var name: String = ""
        switch timerMode {
        case .showRemainingSegmentDuration:
            name = "arrowtriangle.up.square"
        case .showRemainingDuration:
            name = "arrowtriangle.down.square"
        case .showSpentDuration:
            name = "arrowtriangle.up.square.fill"
        }
        return Image(systemName: name)
    }
    
    private func tappedPlayStateButton() {
        if isTimerRunning {
            pauseTimer()
        } else if isTimerPaused {
            resumeTimer()
        } else if !isTimerFinished  {
            startTimer()
        }
    }
    
    func getCurrentSegmentRemainingTime() -> Double {
        var totalTime: Double = 0
        let timeSpent = timerTotalDuration - timerRemainingDuration
        for segment in segments {
            totalTime += segment.duration  // 30
            if timeSpent < totalTime { // 10 < 30
                let remainingSegmentTime = totalTime - timeSpent // 30 - 20
                return remainingSegmentTime
            }
        }
        
        return 0
    }
    
    private func tappedTimeDisplayModeButton() {
        self.timerMode = self.timerMode.nextMode()
    }
    
    var body: some View {
        HStack {
            Spacer()
            Text("\(formattedTime())")
                .font(.largeTitle)
                .frame(width: 100)
            Spacer()
                .frame(width: 16)
            PlayStateButton
                .resizable()
                .frame(width: 30, height: 30)
                .onTapGesture {
                    tappedPlayStateButton()
                }
            Spacer()
                .frame(width: 8)
            TimeDisplayModeButton
                .resizable()
                .frame(width: 30, height: 30)
                .onTapGesture {
                    tappedTimeDisplayModeButton()
                }
            Spacer()
            
        }
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if timerRemainingDuration > 0 {
                timerRemainingDuration -= 1
            } else {
                stopTimer()
            }
            self.delegate?.didUpdate(timer: self, remainingDuration: timerRemainingDuration)
        }
        
        isTimerRunning = true
        isTimerPaused = false
    }
    
    func pauseTimer() {
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
        isTimerPaused = true
    }
    
    func resumeTimer() {
        isTimerPaused = false
        startTimer()
    }
    
    func stopTimer() {
        timerRemainingDuration = 0
        self.isTimerFinished = true
        timer?.invalidate()
        timer = nil
        isTimerRunning = false
        isTimerPaused = false
    }
    
    func formattedTime() -> String {
        var minutes: Int = 0
        var seconds: Int = 0
        switch self.timerMode {
        case .showRemainingDuration:
            minutes = Int(timerRemainingDuration) / 60
            seconds = Int(timerRemainingDuration) % 60
        case .showSpentDuration:
            minutes = Int(timerTotalDuration - timerRemainingDuration) / 60
            seconds = Int(timerTotalDuration - timerRemainingDuration) % 60
        case .showRemainingSegmentDuration:
            let remainingTime = getCurrentSegmentRemainingTime()
            minutes = Int(remainingTime) / 60
            seconds = Int(remainingTime) % 60
        }
        
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct CountdownTimer_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimer(segments: [
            RunningSegment(duration: 05),
            RunningSegment(duration: 50),
            RunningSegment(duration: 20, isBreak: true),
        ])
        .padding()
    }
}

