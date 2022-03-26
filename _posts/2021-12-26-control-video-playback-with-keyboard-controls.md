---
title: Control video playback with keyboard controls
tag: swift
---

For a macOS app to show up in the Now Playing media center (which enables media keys [F7, F8, F9]) you just need to configure the `MPNowPlayingInfoCenter`'s `playbackState`

```swift
func play() {
  self.player.play()
  MPNowPlayingInfoCenter.default().playbackState = .playing
}
```

And then subscribe to `RemoteCommand` changes:

```swift
let commandCenter = MPRemoteCommandCenter.shared()
commandCenter.pauseCommand.addTarget { (event) -> MPRemoteCommandHandlerStatus in
  self.player.pause()
  MPNowPlayingInfoCenter.default().playbackState = .paused
  return .success
}
commandCenter.playCommand.addTarget { (event) -> MPRemoteCommandHandlerStatus in
  self.player.play()
  MPNowPlayingInfoCenter.default().playbackState = .playing
  return .success
}

```

<img width="391" alt="Screen Shot 2021-12-26 at 12 05 47" src="https://user-images.githubusercontent.com/1136388/147415269-a074067d-868e-456f-aa68-a031dab47fb0.png">
