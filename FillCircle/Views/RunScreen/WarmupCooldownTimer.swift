//
//  WarmupCooldownTimer.swift
//  FillCircle
//
//  Created by Jaden Nation on 6/14/23.
//

import SwiftUI

import SwiftUI

struct WarmupCooldownTimer: View {
    let countdownDuration: TimeInterval
    let isWarmup: Bool
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var remainingSeconds: TimeInterval
    
    @Binding var isCountdownComplete: Bool
    
    init(countdownDuration: TimeInterval, isWarmup: Bool, isCountdownComplete: Binding<Bool>) {
        self.countdownDuration = countdownDuration
        self.isWarmup = isWarmup
        self._isCountdownComplete = isCountdownComplete
        self._remainingSeconds = State<TimeInterval>(initialValue: countdownDuration)
    }
    
    var body: some View {
        ZStack {
            if remainingSeconds <= 0 {
                Color.clear
                    .onAppear {
                        isCountdownComplete = true
                    }
            } else {
                Color.black
                    .opacity(0.8)
                    .onReceive(timer) { _ in
                        if remainingSeconds > 0 {
                            remainingSeconds -= 1
                        }
                    }
                
                VStack {
                    Text(isWarmup ? "Warm up" : "Cooldown")
                        .font(.title)
                        .foregroundColor(.white)
                    
                    Text("\(Int(remainingSeconds))")
                        .font(.system(size: 72))
                        .foregroundColor(.white)
                        .padding(.top)
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .animation(.default)
    }
}


struct WarmupCooldownTimer_Previews: PreviewProvider {
    static var previews: some View {
        let isCountdownComplete = Binding.constant(false)
        WarmupCooldownTimer(countdownDuration: 30, isWarmup: true, isCountdownComplete: isCountdownComplete)
    }
}
