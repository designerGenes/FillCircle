//
//  LaunchView.swift
//  FillCircle
//
//  Created by Jaden Nation on 6/6/23.
//

import SwiftUI

protocol RunPresetsListViewDelegate {
    func didTapRunPreset(preset: RunPreset)
}

struct LaunchView: View {
    
  
    var allPresets: [RunPreset] {
        var presets: [RunPreset] = []
        for presetArr in DefaultPresetCollection {
            presets.append(contentsOf: presetArr.presets)
        }
        return presets
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.blukraine()
                    .ignoresSafeArea()
                VStack {
                    Spacer()
                    ZStack {
                        Rectangle()
                            .frame(height: 64)
                        .foregroundColor(.black)
                        Text("Begin!")
                            .foregroundColor(.white)
                            .font(.title)
                    }
                    
                    RunPresetsListView(presets: allPresets)
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(.orange)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 0))
//                .background(
//                    NavigationLink(
//                        <#LocalizedStringKey#>, destination: ContentView(preset: allPresets[selectedRow ?? 0])
//                    )
//                    .hidden()
//                )
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
