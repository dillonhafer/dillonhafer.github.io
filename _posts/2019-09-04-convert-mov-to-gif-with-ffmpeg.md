---
title: Convert .mov to .gif with ffmpeg
tag: workflow
---

Sometimes putting a gif in a pull request is really helpful for reviewers. If you've recorded a movie on an iOS simulator with `xcrun simctl` or just QuickTime, it's very simple to convert them to animated `.gif`s

Example:

```bash
ffmpeg -i screen_recording.mov \
       -s 415x925 \
       -pix_fmt rgb24 \
       -r 10 \
       -f gif \
       screen_recording.gif
```

Now it would be nice to have a function that could extract the video dimensions automatically 🤔 `mdls` 🤯

```shell
1 function gif-mov() {
2   movie=$1
3   height=$(mdls -name kMDItemPixelHeight ${movie} | grep -o '[0-9]\+')
4   width=$(mdls -name kMDItemPixelWidth ${movie} | grep -o '[0-9]\+')
5   dimensions="${width}x${height}"
6   ffmpeg -i ${movie} -s ${dimensions} -pix_fmt rgb24 -r 10 -f gif ${movie}.gif
7 }
```

Usage:

```shell
$ gif-mov ~/Desktop/cool-screen-recording.mov
```
