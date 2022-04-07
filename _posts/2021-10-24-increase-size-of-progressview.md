---
title: Increase size of ProgressView
tag: swiftui
---

You can increase the size of a `ProgressView` by using the `.scaleEffect` method:

```swift
AsyncImage(url: URL(string: video.poster_url)) { phase in
  if let image = phase.image {
      image
        .resizable()
        .aspectRatio(contentMode: .fill)
  } else if phase.error != nil {
    Color.red
  } else {
    ProgressView()
      .scaleEffect(x: 2, y: 2, anchor: .center)
  }
}
.frame(width: width, height: height)
```
