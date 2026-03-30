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
                    if isPlaying { switchGenre("Standard") }
                }) {
                    Text("Standard")
                        .font(.headline)
                }
                Spacer()
                Button(action: {
                    if isPlaying { switchGenre("Sleepy") }
                }) {
                    Text("Sleepy")
                        .font(.headline)
                }
                Spacer()
                Button(action: {
                    if isPlaying { switchGenre("Dance") }
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
    
    func switchGenre(_ genre: String) {
        guard let soundURL = Bundle.main.url(forResource: "A Simple Song of love - \(genre)", withExtension: "m4a") else {
            print("Failed to find 'A Simple Song of love - \(genre).m4a'")
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
            print("Failed to play \(genre) music: \(error)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
