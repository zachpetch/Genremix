//
//  ContentView.swift
//  Genremix
//
//  Created by Zach Petch on 2023-05-26.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = AudioPlayerViewModel()

    var body: some View {
        VStack {
            Spacer()
            Text("Genremix")
                .font(.largeTitle)
            Button(action: {
                viewModel.isPlaying.toggle()
                viewModel.isPlaying ? viewModel.startMusic() : viewModel.stopMusic()
//                viewModel.isPlaying ? viewModel.startMusic() : viewModel.pauseMusic()
            }) {
//                Image(systemName: viewModel.isPlaying ? "pause.circle.fill" : "play.circle.fill")
                Image(systemName: viewModel.isPlaying ? "stop.circle.fill" : "play.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    viewModel.isPlaying ? viewModel.playNormal() : viewModel.doNothing()
                }) {
                    Text("Standard")
                        .font(.headline)
                }
                Spacer()
                Button(action: {
                    viewModel.isPlaying ? viewModel.playSleepy() : viewModel.doNothing()
                }) {
                    Text("Sleepy")
                        .font(.headline)
                }
                Spacer()
                Button(action: {
                    viewModel.isPlaying ? viewModel.playElectro() : viewModel.doNothing()
                }) {
                    Text("Dance")
                        .font(.headline)
                }
                Spacer()
            }

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
