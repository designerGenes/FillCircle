//
//  ContentView.swift
//  FillCircle
//
//  Created by Jaden Nation on 5/30/23.
//

import SwiftUI



struct ContentView: View {
    let audioController = AudioController()
    @State private var isWarmupCountdownComplete = false
    @State private var isCooldownCountdownComplete = false
    @State var isMenuOpen: Bool = false
    @State var percentFinished: Double = 0.0
    var runPreset: RunPreset
    
    var lineWidth: CGFloat = 30.0
    
    var Background: some View {
        Color.blukraine()
    }
    
    var Countdown: CountdownTimer {
        var out = CountdownTimer(runPreset: runPreset)
        out.delegate = self
        return out
    }
    
    var SegmentedCircleStack: some View {
        ZStack {
            Circle() // background
                .stroke(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: lineWidth))
            SegmentedCircle(preset: runPreset)
            Circle()
                .padding() // center
        }
        .rotationEffect(Angle(degrees: (-360 * self.percentFinished)))
        .padding(50)
    }
    
    var TopMenu: some View {
        HStack {
            Spacer()
            Image(systemName: "line.horizontal.3")
                .foregroundColor(.yellow)
                .onTapGesture {
                    isMenuOpen = !isMenuOpen
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 24))
        }
    }
    
    var HamburgerMenu: some View {
        let width = UIScreen.main.bounds.width / 2.5
        return Rectangle()
            .foregroundColor(.yellow)
            .frame(width: width, height: UIScreen.main.bounds.height)
            .position(x: UIScreen.main.bounds.width - (width / 2), y: UIScreen.main.bounds.height / 2)
            .ignoresSafeArea(.all)
            .transition(.move(edge: .trailing))
    }
    
    var body: some View {
        ZStack {
            ZStack {
                Background
                VStack {
                    Spacer()
                        .frame(height: 64)
                    TopMenu
                    Spacer()
                }
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
                    SegmentedCircleStack
                }
                if !isWarmupCountdownComplete {
                    WarmupCooldownTimer(countdownDuration: runPreset.warmupTime, isWarmup: true, isCountdownComplete: $isWarmupCountdownComplete)
                }
                if !isCooldownCountdownComplete && percentFinished >= 100 {
                    WarmupCooldownTimer(countdownDuration: runPreset.cooldownTime, isWarmup: false, isCountdownComplete: $isCooldownCountdownComplete)
                }
            }
            .ignoresSafeArea()
            .offset(x: isMenuOpen ? -UIScreen.main.bounds.width / 2.5 : 0)
            .animation(Animation.easeInOut, value: 1)
            if isMenuOpen {
                HamburgerMenu
            }
        }
        
        
    }
}

extension ContentView: CountdownTimerDelegate {
    func didReachThresholdInCountdown(timer: CountdownTimer, countdownThreshold: CountdownThreshold) {
        //
    }
    
    // MARK: - CountdownTimerDelegate methods
    func didUpdate(timer: CountdownTimer, remainingDuration: Double) {
        self.percentFinished = 1 - (remainingDuration / runPreset.runningTime)
    }
    
    func didEnterNewSegment(idx: Int) {
        //        audioController.playClip(asset: .BeginRun)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(percentFinished: 0,
                    runPreset: DefaultPresetCollection[1].presets[0])
    }
}
