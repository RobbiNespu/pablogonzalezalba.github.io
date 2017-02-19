---
layout: post
title: "Great tools: xmobar"
date: 2017-02-19 22:01:42 +0100
tags: a-post-a-day great-tools
---

An amazing addition to [xmonad]({% post_url 2017-02-11-great-tools-xmonad %}).

## Status bars

I got used to simple status bars: just to see the time and, sometimes, an app notification. My new awesome window manager, xmonad, comes without a status bar, so I looked for a replacement. I didn't want something fancy, the easier to set up, the better, and the only requirement was to show the date and time.

I learned that there are a lot of status bars, but I chose [xmobar](http://projects.haskell.org/xmobar/) since it was made in Haskell and specifically to work with xmonad, though it now works with any window manager.

## xmobar

The easiest way to install it is with *cabal-install*, that you probably already have if you are using xmonad: `cabal install xmobar`. Otherwise you can follow any of the alternative install steps in the [official docs](http://projects.haskell.org/xmobar/#installation).

You can start it manually with `xmobar`, although you'll probably want to add that to one of your scripts that run automatically when you login. Also, if you are using xmonad, make sure to use [avoidStruts](http://xmonad.org/xmonad-docs/xmonad-contrib/XMonad-Hooks-ManageDocks.html) so your windows don't overlap the status bar.

That's it! You now have a, very basic, status bar running. Let's make it your own.

## Configuring

Edit the file `~/.xmobarrc` and start changing the defaults around, restart xmobar to see your changes. My first adjustments were the font and size, otherwise it was impossible to read on my 4K monitors.

After you've configured the style to your liking, the most important items are:

- **commands**: where you specify what you're going to execute. Each internal command has its own format, but if you want to run any external command, the format is: `Com ProgramName Args Alias RefreshRate`, where `Args` is an array of arguments and the `RefreshRate` is on tenths of seconds.
- **template**: where you specify the order in which your commands' output will be displayed on the status bar.

I use my own commands to show [Dropbox](https://www.dropbox.com/)'s status and the [current weather]({% post_url 2017-02-09-great-tools-wttr-dot-in %}) that were surprisingly more useful that I'd initially thought.

You can see my current [.xmobarrc](https://github.com/pablogonzalezalba/dotfiles/blob/master/.xmobarrc), of which the template is:

{% raw %}```
template = "} Dropbox: %dropbox% { %cpu% %coretemp% | %memory% * %swap% | %weather_mini% | <fc=#ee9a00>%date%</fc>"
```{% endraw %}

And it looks like this[^1]:

![My xmobar]({{ site.url }}/assets/img/xmobar.jpg)

There are many possibilities to play around, you can even find data you never imagined could be interesting to display. So let's give a new status bar a try.

{% include footnotes.md %}

[^1]: Well, almost like that, the Dropbox status is in the middle of the screen, but I had to cut it so it would fit this page.
