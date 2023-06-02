//
//  CountdownTimer.swift
//  FillCircle
//
//  Created by Jaden Nation on 5/31/23.
//

import SwiftUI

enum CountdownTimerMode {
    case showTotalDuration
    case showRemainingDuration
    case showSpentDuration
}

import SwiftUI


protocol CountdownTimerDelegate {
    func didUpdate(timer: CountdownTimer, remainingDuration: Double)
}

struct CountdownTimer: View {
    let totalTimerDuration: TimeInterval // original time
    @State var timerRemainingDuration: TimeInterval // used for pausing
    @State private var isTimerFinished: Bool = false
    @State private var isTimerRunning = false
    @State private var isTimerPaused = false
    @State private var timer: Timer?
    var delegate: CountdownTimerDelegate?
    
    
    var body: some View {
        Text("\(formattedTime())")
            .font(.largeTitle)
            .onTapGesture {
                if isTimerRunning {
                    pauseTimer()
                } else if isTimerPaused {
                    resumeTimer()
                } else if !isTimerFinished  {
                    startTimer()
                }
            }
    }
    
    init(timerDuration: TimeInterval) {
        self.totalTimerDuration = timerDuration
        self._timerRemainingDuration = State(initialValue: timerDuration)
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
        let minutes = Int(timerRemainingDuration) / 60
        let seconds = Int(timerRemainingDuration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct CountdownTimer_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimer(timerDuration: 90)
    }
}

