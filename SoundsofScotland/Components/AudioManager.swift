//
//  AudioManager.swift
//  SoundsofScotland
//
//  Created by Bradley Morrison on 19/05/2023.
//

import Foundation
import AVFoundation

@MainActor class AudioManager : ObservableObject {
    var audioPlayer : AVAudioPlayer?
    
    func loadAudio(filename: String) {
        guard let path = Bundle.main.path(forResource: filename, ofType: "wav") else {
            print("[shark]", filename + " is not found")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            print("playing")
        } catch {
            print("[shark], audioPlayer cannot load", path, error)
        }
    }
    
    func playAudio() {
        audioPlayer?.play()
    }
    
    func stopAudio() {
        audioPlayer?.stop()
    }
}
