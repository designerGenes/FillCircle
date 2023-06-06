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

struct RunPresetsListView: View {
    @Binding var selectedRow: Int?
    var delegate: RunPresetsListViewDelegate?
    
    var presets: [RunPreset]
    
    var body: some View {
        VStack {
            Spacer()
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(presets) { preset in
                        NavigationLink(destination: ContentView(segments: preset.segments)) {
                            RunPresetListViewItem(runPreset: preset)
                        }
                    }
                }
                .padding()
            }
            .scrollIndicators(.hidden)
        }
        
    }
}

struct LaunchView: View {
    @State private var selectedRow: Int?
  
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
                    RunPresetsListView(selectedRow: $selectedRow, presets: allPresets)
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 32, trailing: 0))
                .background(
                    NavigationLink(
                        destination: ContentView(segments: allPresets[selectedRow ?? 0].segments),
                        tag: selectedRow ?? 0,
                        selection: $selectedRow,
                        label: { EmptyView() }
                    )
                    .hidden()
                )
            }
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
