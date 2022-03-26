---
title: Add a folder to git with exceptions
tag: git
---

Given this folder structure:

```
app
├── bin
│  └── parse-ansi-codes.rs
├── Cargo.lock
├── Cargo.toml
├── README.md
├── src
│  ├── cursor.rs
│  ├── lib.rs
│  └── style.rs
├── target
│  └── debug
└── test
```

I can add the entire `app` directory to git, while ignoring the bin folder:


```
$ git add . ':!bin'
```
