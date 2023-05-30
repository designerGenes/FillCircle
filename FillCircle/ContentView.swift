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
        
    }
    
    func animateRotation() {
        
    }
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 11/255.0, green: 15/255.0, blue: 128/255.0, alpha: 1))
            ZStack {
                Circle() // background
                    .stroke(Color.white.opacity(0.3), style: StrokeStyle(lineWidth: 30))
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color.yellow, style: StrokeStyle(lineWidth: 30))
                    .rotationEffect(.init(degrees: -90))
                Circle()
                    .trim(from: 0, to: 0.3)
                    .stroke(Color.orange, style: StrokeStyle(lineWidth: 30))
                    .rotationEffect(.init(degrees: -200))
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
