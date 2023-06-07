//
//  ContentView.swift
//  FillCircle
//
//  Created by Jaden Nation on 5/30/23.
//

import SwiftUI



struct ContentView: View {
    var audioController = AudioController()
    @State var isMenuOpen: Bool = false
    @State var percentFinished: Double = 0.0
    @State var segments: [RunningSegment]
    var countdownDuration: TimeInterval {
        return segments.reduce(0, { $0 + $1.duration })
    }
    
    var lineWidth: CGFloat = 30.0
    
    var Background: some View {
        Color.blukraine()
    }
    
    var Countdown: CountdownTimer {
        var out = CountdownTimer(segments: segments)
        out.delegate = self
        return out
    }
    
    func tappedOpenMenu() {
        isMenuOpen = !isMenuOpen
    }
    
    var body: some View {
        ZStack {
            ZStack {
                Background
                VStack {
                    Spacer()
                        .frame(height: 64)
                    HStack {
                        Spacer()
                        Image(systemName: "line.horizontal.3")
                            .foregroundColor(.yellow)
                            .onTapGesture {
                                tappedOpenMenu()
                            }
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 24))
                    }
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
                    ZStack {
                        Circle() // background
                            .stroke(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: lineWidth))
                        SegmentedCircle(runningSegments: segments)
                        Circle()
                            .padding() // center
                    }
                    .rotationEffect(Angle(degrees: (-360 * self.percentFinished)))
                    .padding(50)
                }
            }
            .ignoresSafeArea()
            .offset(x: isMenuOpen ? -UIScreen.main.bounds.width / 2.5 : 0)
            .animation(Animation.easeInOut, value: 1)
            if isMenuOpen {
                let width = UIScreen.main.bounds.width / 2.5
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: width, height: UIScreen.main.bounds.height)
                    .position(x: UIScreen.main.bounds.width - (width / 2), y: UIScreen.main.bounds.height / 2)
                    .ignoresSafeArea(.all)
                    .transition(.move(edge: .trailing))
                
            }
        }
        
        
    }
}

extension ContentView: CountdownTimerDelegate {
    // MARK: - CountdownTimerDelegate methods
    func didUpdate(timer: CountdownTimer, remainingDuration: Double) {
        self.percentFinished = 1 - (remainingDuration / countdownDuration)
        
        var totalTime: TimeInterval = 0
        var idx = 0
        while totalTime < timer.timerTotalDuration - remainingDuration {
            totalTime += segments[idx].duration
            idx += 1
        }
        if totalTime == segments[0..<idx].reduce(0, {$0 + $1.duration}) {
            didEnterNewSegment(idx: idx)
        }
    }
    
    func didEnterNewSegment(idx: Int) {
        audioController.playClip(asset: .BeginRun)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(percentFinished: 0,
                    segments: [
                        RunningSegment(duration: 120),
                        RunningSegment(duration: 60, isBreak: true),
                        RunningSegment(duration: 120),
                        RunningSegment(duration: 60, isBreak: true)
                    ])
    }
}
