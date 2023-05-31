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

struct CountdownTimer: View {
    let totalTimerDuration: TimeInterval // original time
    @State var timerDuration: TimeInterval // used for pausing
    @State private var isTimerFinished: Bool = false
    @State private var remainingTime: TimeInterval?
    @State private var isTimerRunning = false
    @State private var isTimerPaused = false
    @State private var timer: Timer?

    var body: some View {
        Text("\(formattedTime())")
            .font(.largeTitle)
            .onTapGesture {
                if isTimerRunning {
                    pauseTimer()
                } else {
                    if isTimerPaused {
                        resumeTimer()
                    } else if !isTimerFinished  {
                        startTimer()
                    }
                }
            }
    }

    init(timerDuration: TimeInterval) {
        self.totalTimerDuration = timerDuration
        self.timerDuration = timerDuration
    }

    func startTimer() {
        remainingTime = timerDuration
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if remainingTime! > 0 {
                remainingTime! -= 1
            } else {
                stopTimer()
            }
        }
        isTimerRunning = true
        isTimerPaused = false
    }

    func pauseTimer() {
        timerDuration = remainingTime ?? 0
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
        let minutes = Int(remainingTime ?? timerDuration) / 60
        let seconds = Int(remainingTime ?? timerDuration) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct CountdownTimer_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimer(timerDuration: 10)
    }
}

