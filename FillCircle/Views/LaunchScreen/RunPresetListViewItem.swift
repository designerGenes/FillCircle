//
//  RunPresetListViewItem.swift
//  FillCircle
//
//  Created by Jaden Nation on 6/6/23.
//

import SwiftUI

struct RunPresetListViewItem: View {
    private var runPreset: RunPreset
    
    init(runPreset: RunPreset) {
        self.runPreset = runPreset
    }
    
    var iconName: String {
        return UserProfileController.loadedUser?.completedRunPresets.contains(runPreset.id) == true ? "record.circle.fill" : "record.circle"
    }
    var body: some View {
        VStack {
            HStack {
                Text(runPreset.title)
                    .font(.bold(.headline)())
                    .foregroundColor(.white)
            }
            HStack {
                Text(runPreset.subtitle)
                    .font(.headline)
                    .foregroundColor(.white.opacity(0.8))
            }
            Spacer()
                .frame(height: 8)
            Image(systemName: iconName)
                .foregroundColor(.white)
        }
        .padding(EdgeInsets(top: 0, leading: 24, bottom: 0, trailing: 24))
        .frame(width: 120, height: 100, alignment: .center)
        .background(!runPreset.customName.isEmpty ? Color.yellow : Color.gray)
    }
}

struct RunPresetListViewItem_Previews: PreviewProvider {
    static var previews: some View {
        RunPresetListViewItem(runPreset: DefaultPresetCollection[0].presets[0])
            .previewLayout(.fixed(width: UIScreen.main.bounds.width, height: 100))
    }
}
