---
title: Open images in vim with iTerm 🖼
---

iTerm 3 has a built in shell script called [imgcat](https://www.iterm2.com/documentation-images.html) for displaying images in the terminal. With one simple `autocmd` in my vim configuration I can open images*:

```vim
:autocmd BufEnter *.png,*.jpg,*gif exec "! ~/.iterm2/imgcat ".expand("%") | :bw
```

In my command I wipe the image buffer(`:bw`) because I don't want large images sitting around in buffers, but this is easy to change.

<img alt="imgcat" title="imgcat" src="https://s3.amazonaws.com/files.dillonhafer.com/c9b5bb7baf.gif" width="1000" />

**imgcat does not work with tmux*
