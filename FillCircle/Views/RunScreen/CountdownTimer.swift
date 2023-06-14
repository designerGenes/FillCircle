//
//  CountdownTimer.swift
//  FillCircle
//
//  Created by Jaden Nation on 5/31/23.
//

import SwiftUI



protocol CountdownTimerDelegate {
    func didUpdate(timer: CountdownTimer, remainingDuration: Double)
    func didReachThresholdInCountdown(timer: CountdownTimer, countdownThreshold: CountdownThreshold)
}

struct CountdownTimer: View {
    var runPreset: RunPreset

    var timerRemainingDuration: TimeInterval {
        return runPreset.runningTime - timerSpentDuration
    }
 
    @State var timerSpentDuration: TimeInterval = 0
    @State private var isTimerFinished: Bool = false
    @State private var isTimerRunning = false
    @State private var isTimerPaused = false
    @State private var timer: Timer?
    var delegate: CountdownTimerDelegate?
    @State var timerMode: CountdownTimerMode = .showRemainingSegmentDuration

    
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
        for segment in runPreset.runningSegments {
            totalTime += segment.duration  // 30
            if totalTime > timerSpentDuration { // 30 > 10
                return totalTime - timerSpentDuration
            }
        }
        
        return 0
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
                    self.timerMode = self.timerMode.nextMode()
                }
            Spacer()
            
        }
    }
    
    private func ticktimer() {
        
        if timerRemainingDuration > 0 {
            timerSpentDuration += 1
        } else {
            stopTimer()
        }
        self.delegate?.didUpdate(timer: self, remainingDuration: timerRemainingDuration)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.ticktimer()
        }

        isTimerRunning = true
        isTimerPaused = false
        self.delegate?.didUpdate(timer: self, remainingDuration: timerRemainingDuration)
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
            minutes = Int(runPreset.runningTime - timerRemainingDuration) / 60
            seconds = Int(runPreset.runningTime - timerRemainingDuration) % 60
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
        CountdownTimer(runPreset: RunPreset(week: 1, day: 1, segments: [
            RunningSegment(duration: 05),
            RunningSegment(duration: 50),
            RunningSegment(duration: 20, isBreak: true),
        ]))
        .padding()
    }
}

