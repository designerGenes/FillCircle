//
//  RunPresetsListView.swift
//  FillCircle
//
//  Created by Jaden Nation on 6/9/23.
//

import SwiftUI

struct RunPresetsListView: View {
    
    var delegate: RunPresetsListViewDelegate?
    
    var presets: [RunPreset]

    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 3) {
                    ForEach(presets) { preset in
                        NavigationLink(destination: ContentView(runPreset: preset)) {
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

struct RunPresetsListView_Previews: PreviewProvider {
    static var previews: some View {
        RunPresetsListView(presets: DefaultPresetCollection[0].presets)
    }
}
