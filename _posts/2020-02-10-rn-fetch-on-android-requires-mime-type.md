---
title: RN fetch on Android requires mime type
tag: react
---

ReactNative on Android requires a mime type when uploading files with `FormData`. But the only way to get the mime type of a user-chosen file is to read the file or files into memory after a user select one or more. In all of my use cases, my server didn't care if the mimetype was in the `FormData`.

The easy solution is to just set the mimetype to a binary file type (e.g. `application/octet-stream`):

```ts
let data = new FormData();
data.append("file", {
  name: "cool.pdf",
  uri: "///files/cool.pdf",
  // MIME-type required on Android
  type: "application/octet-stream"
});

fetch("http://example.com/upload-file", data);
```
