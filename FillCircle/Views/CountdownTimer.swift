//
//  CountdownTimer.swift
//  FillCircle
//
//  Created by Jaden Nation on 5/31/23.
//

import SwiftUI

enum CountdownTimerMode: Int {
    case showRemainingDuration
    case showTotalDuration
    case showSpentDuration
    
    static func values() -> [CountdownTimerMode] {
        return [.showRemainingDuration, .showTotalDuration, .showSpentDuration]
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
    @State var timerMode: CountdownTimerMode = .showRemainingDuration
    
    var PlayStateButton: Image {
        let name = isTimerRunning ? "pause.rectangle.fill" : "play.square.fill"
        return Image(systemName: name)
    }
    
    var TimeDisplayModeButton: Image {
        var name: String = ""
        switch timerMode {
        case .showTotalDuration:
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
    
    private func tappedTimeDisplayModeButton() {
        // what an awful function but time is brief
        self.timerMode = self.timerMode.nextMode()
    }
    
    var body: some View {
        HStack {
            Spacer()
            Text("\(formattedTime())")
                .font(.largeTitle)
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
        var minutes: Int = 0
        var seconds: Int = 0
        switch self.timerMode {
        case .showRemainingDuration:
            minutes = Int(timerRemainingDuration) / 60
            seconds = Int(timerRemainingDuration) % 60
        case .showSpentDuration:
            minutes = Int(totalTimerDuration - timerRemainingDuration) / 60
            seconds = Int(totalTimerDuration - timerRemainingDuration) % 60
        case .showTotalDuration:
            minutes = Int(totalTimerDuration) / 60
            seconds = Int(totalTimerDuration) % 60
        }

        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct CountdownTimer_Previews: PreviewProvider {
    static var previews: some View {
        CountdownTimer(timerDuration: 60)
            .padding()
    }
}

