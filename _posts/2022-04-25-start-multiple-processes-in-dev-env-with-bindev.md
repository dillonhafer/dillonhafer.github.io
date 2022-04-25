---
title: Start multiple processes in dev env with bin/dev
tag: rails
---

Rails comes with `bin/dev` to start multiple processes from a `Procfile.dev`

```
# Procfile.dev
web: bin/rails server -p 3000
css: bin/rails tailwindcss:watch
jobs: bin/good_job
firebase: firebase emulators:start --import=./emulator-data
```

So that you can run everything at once:

```sh
$ bin/dev
〉bin/dev
08:36:10 web.1  | started with pid 40038
08:36:10 css.1  | started with pid 40039
08:36:10 fire.1 | started with pid 40040
08:36:11 firebase.1 | i  emulators: Starting emulators: auth, firestore, storage
08:36:11 firebase.1 | i  firestore: Firestore Emulator logging to firestore-debug.log
08:36:11 web.1  | => Booting Puma
08:36:11 web.1  | => Rails 7.0.2.3 application starting in development
08:36:11 web.1  | => Run `bin/rails server --help` for more startup options
08:36:12 web.1  | Puma starting in single mode...
08:36:12 web.1  | * Puma version: 5.6.4 (ruby 3.1.2-p20) ("Birdie's Version")
08:36:12 web.1  | *  Min threads: 5
08:36:12 web.1  | *  Max threads: 5
08:36:12 web.1  | *  Environment: development
08:36:12 web.1  | *          PID: 40038
08:36:12 web.1  | * Listening on http://127.0.0.1:3000
08:36:12 web.1  | * Listening on http://[::1]:3000
08:36:12 web.1  | Use Ctrl-C to stop
08:36:12 css.1  |
08:36:12 css.1  | Rebuilding...
08:36:12 css.1  | Done in 300ms.
```
