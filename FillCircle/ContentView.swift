//
//  ContentView.swift
//  FillCircle
//
//  Created by Jaden Nation on 5/30/23.
//

import SwiftUI

struct ContentView: View {
    @State var percentYellow: CGFloat = 0.5
    @State var percentOrange: CGFloat = 0.3
    
    func animatePercentageChange() {
        percentYellow = CGFloat(Int.random(in: 0..<100)) / 100
        percentOrange = 1 - percentYellow
    }
    
    func animateRotation() {
        
    }
    
    var Background: some View {
        Color(UIColor(red: 11/255.0, green: 15/255.0, blue: 128/255.0, alpha: 1))
    }
    
    var body: some View {
        ZStack {
            Background
            ZStack {
                Circle() // background
                    .stroke(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: 30))
                Circle()  // YELLOW
                    .trim(from: 0, to: percentYellow)
                    .stroke(Color.yellow, style: StrokeStyle(lineWidth: 30))
                    .rotationEffect(.init(degrees: -90))
                    .animation(.default)
                Circle() // ORANGE
                    .trim(from: 0, to: percentOrange)
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: 30))
                    .rotationEffect(.init(degrees: -200))
                    .animation(.default)
                Circle() // center
                
                Circle()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        animatePercentageChange()
                    }
                
                    
            }
            .padding(50)
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
