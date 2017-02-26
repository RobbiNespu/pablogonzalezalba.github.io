---
layout: post
title: "Installing React Native on Linux Mint with xmonad"
draft_date: 2017-02-26 19:25:57 +0100
date: 2017-02-26 20:25:45 +0100
tags: a-post-a-day project-checkers
---

Why is it *still* so hard to install things in Linux?

I've decided to use **React Native** for my [new project]({% post_url 2017-02-25-new-project-checkers %}) and I felt like I was installing **Linux** again in the early 2000's. I'm writing this post mainly for my future self if I have to reinstall something, however it may be that something that I did also helps someone else.

## Installation

The [official documentation](https://facebook.github.io/react-native/docs/getting-started.html) is very good, so I'll follow that and only comment in the issues I've encountered.

- **Node.js**: I've already had it installed, and it's available on the [package manager](https://nodejs.org/en/download/package-manager/) of most distros.
- **The React Native CLI**: Depending where/how did you install **Node.js**, you'll need to run the command with sudo: `sudo npm install -g react-native-cli`
- **Android Studio**:
  - You need **Java**. Yeah, it may seem very obvious but it wasn't written anywhere in the installation procedures.
  - You also need the *JDK*, not just the *JRE*. Hopefully it seems like **openjdk** works well enough: `sudo apt-get install default-jdk`
  - You need to set up `$JAVA_HOME` and probably add it to your PATH, I have the following that may help:
    ```
    $ which java
    /usr/bin/java
    $ sudo update-alternatives --config java
    There is only one alternative in link group java (providing /usr/bin/java): /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java
    $ echo $JAVA_HOME
    /usr/lib/jvm/java-8-openjdk-amd64
    ```
    Also [this answer on StackOverflow](http://stackoverflow.com/questions/14788345/how-to-install-jdk-on-ubuntu-linux)
  - Download [ Android Studio](https://developer.android.com/studio/index.html)
  - *Choose Custom installation when asked! Refer to React Native instructions* And [follow the instructions](https://developer.android.com/studio/install.html)
    - Here I couldn't continue with **xmonad**, the `android-studio/bin/studio.sh` file opens a window that hangs and can't be interacted. I've tried moving it, resizing it, fullscreening it, downloading previous versions but I was unsuccessful. I had to log out and proceed with **Xcfe**. After installing it still doesn't work, but it's not needed for **React Native**, only the **Android Virtual Device**, if I understood correctly.
  - **VM acceleration**: I already had it working, you can check that easily running `kvm-ok`, install that with `sudo apt install cpu-checker`
  - **Watchman**: the [instructions](https://facebook.github.io/watchman/docs/install.html#build-install) worked, but it broke `jekyll serve` because of too many inotify watchers. It's [easily fixable](https://github.com/guard/listen/wiki/Increasing-the-amount-of-inotify-watchers).
  - **Android Virtual Device**: This runs fine inside **xmonad**. I had a pre-installed *Nexus 5X* that didn't work, but I could install other devices.
- **Testing your React Native**: `react-native run-android` doesn't seem to work unless you have a running instance of `react-native start`. I don't quite understand which one does what, but it seems that you need both.
- **Menu key**: If you can't shake the device and it doesn't have a menu key, you can simulate one with this: `adb shell input keyevent KEYCODE_MENU` and it'll display the Developer Menu.

## It's done

Finally, it works! It took me over 2 hours to set everything up but watching the emulator auto-refreshing when I made a change in the code was worth it. Although in the middle I considered buying a MacBook Air, a Mac Mini or even making a Hackintosh.

Now that we have the environment ready, it's time to start working!
