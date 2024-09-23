//
//  ContentView.swift
//  Genremix
//
//  Created by Zach Petch on 2023-05-26.
//

import SwiftUI
import AVFoundation
import CoreAudio

struct ContentView: View {
    
    @State private var audioPlayerA: AVAudioPlayer!
    @State private var audioPlayerB: AVAudioPlayer!
    @State private var isA = true
    @State private var isPlaying = false
    @State private var startTime: Double = 0.0
    @State private var timeStamp: Double = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            Text("Genremix")
                .font(.largeTitle)
            Button(action: {
                isPlaying.toggle()
                isPlaying ? startMusic() : stopMusic()
//                isPlaying ? startMusic() : pauseMusic()
            }) {
//                Image(systemName: isPlaying ? "pause.circle.fill" : "play.circle.fill")
                Image(systemName: isPlaying ? "stop.circle.fill" : "play.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    isPlaying ? playNormal() : doNothing()
                }) {
                    Text("Standard")
                        .font(.headline)
                }
                Spacer()
                Button(action: {
                    isPlaying ? playSleepy() : doNothing()
                }) {
                    Text("Sleepy")
                        .font(.headline)
                }
                Spacer()
                Button(action: {
                    isPlaying ? playElectro() : doNothing()
                }) {
                    Text("Dance")
                        .font(.headline)
                }
                Spacer()
            }

        }
        .padding()
    }
    
    func getTimeStamp() -> Double {
        let currentTime = CACurrentMediaTime()
        return currentTime - startTime
    }
    
    func startMusic() {
        guard let soundURL = Bundle.main.url(forResource: "A Simple Song of love - Standard", withExtension: "m4a") else {
            print("Failed to find 'A Simple Song of love - Standard.m4a'")
            return
        }

        do {
            audioPlayerA = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayerA.currentTime = timeStamp
            startTime = CACurrentMediaTime()
            audioPlayerA.play()
        } catch {
            print("Failed to play music: \(error)")
        }
    }
    
    func pauseMusic() {
        timeStamp = audioPlayerA.currentTime
        audioPlayerA.pause()
    }
    
    func stopMusic() {
        timeStamp = 0.0
        audioPlayerA.pause()
        audioPlayerB.pause()
    }
    
    func playNormal() {
        // Load the basic version of the song
        guard let soundURL = Bundle.main.url(forResource: "A Simple Song of love - Standard", withExtension: "m4a") else {
            print("Failed to find 'A Simple Song of love - Standard.m4a'")
            return
        }
        
        do {
            let newPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            newPlayer.currentTime = getTimeStamp()
            
            if isA {
                audioPlayerB = newPlayer
                audioPlayerB.play()
                audioPlayerA.pause()
                isA = false
            } else {
                audioPlayerA = newPlayer
                audioPlayerA.play()
                audioPlayerB.pause()
                isA = true
            }
        } catch {
            print("Failed to play Standard music: \(error)")
        }
    }
    
    func playElectro() {
        // Load the Electro version of the song
        guard let soundURL = Bundle.main.url(forResource: "A Simple Song of love - Dance", withExtension: "m4a") else {
            print("Failed to find 'A Simple Song of love - Dance.m4a'")
            return
        }
        
        do {
            // Create a new audio player for the Electro version
            let newPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            // Set the current timestamp on the Electro player
            newPlayer.currentTime = getTimeStamp()
            
            if isA {
                audioPlayerB = newPlayer
                audioPlayerB.play()
                audioPlayerA.pause()
                isA = false
            } else {
                audioPlayerA = newPlayer
                audioPlayerA.play()
                audioPlayerB.pause()
                isA = true
            }
        } catch {
            print("Failed to play Electro music: \(error)")
        }
    }
    
    func doNothing() {
        print("Nothing doing")
    }
    
    func playSleepy() {
        // Load the basic version of the song
        guard let soundURL = Bundle.main.url(forResource: "A Simple Song of love - Sleepy", withExtension: "m4a") else {
            print("Failed to find 'A Simple Song of love - Sleepy.m4a'")
            return
        }
        
        do {
            let newPlayer = try AVAudioPlayer(contentsOf: soundURL)
            
            newPlayer.currentTime = getTimeStamp()
            
            if isA {
                audioPlayerB = newPlayer
                audioPlayerB.play()
                audioPlayerA.pause()
                isA = false
            } else {
                audioPlayerA = newPlayer
                audioPlayerA.play()
                audioPlayerB.pause()
                isA = true
            }
        } catch {
            print("Failed to play Sleepy music: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
