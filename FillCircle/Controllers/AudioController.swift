//
//  AudioController.swift
//  FillCircle
//
//  Created by Jaden Nation on 6/6/23.
//

import Foundation
import AVFoundation

enum AudioClipAsset: String {
    case BeginRun, Cooldown, OneMinute, WarmUp
}

class AudioController {
    var audioPlayer: AVAudioPlayer?
    
    func playClip(asset: AudioClipAsset) {
        guard let url = Bundle.main.url(forResource: asset.rawValue, withExtension: "wav") else {
            return
        }
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            
        }
    }
}
