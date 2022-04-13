---
title: curl with a progress bar
tag: command-line
---

You can download files with a nice progress bar using curl's `-#` flag:

```
curl -# -O https://files.example.com/large/long_video.mp4
#################                               38.6%
```

This might be preferable to the verbose output:

```
curl --no-progress-meter -O https://files.example.com/large/long_video.mp4
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
 17  433M   17 75.6M    0     0  28.7M      0  0:00:15  0:00:02  0:00:13 28.8M
```
