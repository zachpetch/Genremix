# Genremix Music Player

## Overview
**Genremix** is a prototype of an iOS app that allows users to listen to music that's been specially produced to play in multiple genres, providing a novel and versatile listening experience, catering to listeners with diverse musical tastes.

## Features
- **Multi-Genre Playback**: Switch between different genres for each song.

## Installation
To get started with the Genremix Music Player, follow these steps:

1. Clone the repository
   ```bash
   git clone https://github.com/zachpetch/Genremix.git
   cd Genremix
   ```
2. Open the project in Xcode

3. Build and run the app on your iOS device or simulator.

## Usage
1. Launch the app on your iOS device or simulator.
2. Browse the music library (currently almost as sparse as it gets, with one poorly recorded song).
3. Use the genre switching buttons to change the genre of the currently playing song.

## Ideas & Next Steps

### Playback Improvements
- **Pause/resume support** — currently the play button only stops (resets to beginning); re-enable the commented-out pause functionality so users can pick up where they left off
- **Crossfade between genres** — instead of a hard cut when switching genres, briefly overlap and fade the two players for a smoother transition
- **Progress bar / scrubber** — show a timeline with the current playback position and let users seek to a specific point in the song
- **Now-playing info** — display the current song title, genre, and elapsed/remaining time
- **Highlight the active genre** — visually indicate which genre button is currently playing (e.g., bold, color, or underline)
- **Disable genre buttons when stopped** — grey out or hide genre buttons when nothing is playing, rather than silently no-oping

### Music Library
- **Multiple songs** — expand beyond the single track; add a song list or library view to browse and select songs
- **Dynamic genre discovery** — scan the bundle (or a directory) for audio files and auto-detect available genres per song from the filename convention, instead of hard-coding genre buttons
- **Album art** — display cover artwork for each song

### Architecture & Code Quality
- **Extract an audio manager** — move playback logic out of `ContentView` into a dedicated `ObservableObject` (e.g., `AudioPlayerViewModel`) to separate UI from audio concerns
- **Eliminate duplicated genre-switch code** — the three play functions (`playNormal`, `playElectro`, `playSleepy`) share nearly identical logic; refactor into a single `switchGenre(_ genre: String)` method
- **AVAudioSession configuration** — set up an audio session category (e.g., `.playback`) so audio continues when the app is backgrounded or the screen locks

### UX & Design
- **Improved visual design** — add styling, colors, and layout polish beyond the default SwiftUI look
- **Animations** — animate genre switches (e.g., button press feedback, waveform visualization)
- **Accessibility** — add VoiceOver labels and dynamic type support
- **iPad / landscape support** — adapt the layout for larger screens

### Longer-Term Ideas
- **Streaming / remote content** — load songs from a server instead of bundling them in the app
- **User-generated content** — let artists upload multi-genre tracks
- **Playlist support** — queue up multiple songs with auto-advance
- **Background audio & lock screen controls** — integrate with `MPNowPlayingInfoCenter` and `MPRemoteCommandCenter` for lock screen and Control Center playback controls

## Contributing
I'd welcome your contributions. If interested, please follow these steps:

1. Fork the repository
2. Create a new branch
3. Make and commit your changes
4. Push to the branch
5. Open a pull request

## License
I've opted to license this under the MIT License - see the LICENSE.md file for details.
