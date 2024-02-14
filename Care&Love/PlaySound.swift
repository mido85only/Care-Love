//
//  PlaySound.swift
//  Care&Love
//
//  Created by mohammed on 14/02/2024.
//

import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(soundFile: String , soundType: String){
    
    if let path = Bundle.main.path(forResource: soundFile, ofType: soundType){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
            audioPlayer?.play()
        }catch{
         print ("unable to play audio")
        }
    }
}
