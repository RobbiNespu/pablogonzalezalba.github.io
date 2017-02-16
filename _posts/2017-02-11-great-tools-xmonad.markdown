---
layout: post
title: "Great tools: xmonad"
date: 2017-02-11 19:59:37 +0100
tags: a-post-a-day great-tools
---

The window manager that made me care about window managers.

## Screen real estate

In the beginning I used a 640x480 monitor and it was good. I went through many CRT displays until the day my 17" 1024x768 monitor died. I was just starting to work as a software developer so I decided I needed an upgrade and bought a 22" FullHD LCD.

That was a big change, for the first time I could have 2 windows open side by side and my performance went through the roof[^1]. I got used to [KDE](https://www.kde.org/)'s multiple desktops and it seemed like I didn't need anything else.

Until I got a laptop. The 1600x900 display was okay-ish, but the true revelation came when I connected it to my monitor. Two monitors! That was heaven. Since I used my laptop mainly on-the-go, I got another 22" FullHD monitor for my desktop and that was how I worked[^2].

Before moving to Amsterdam I decided to sell almost everything[^3] so I had to start again. Go big or go home, they say. So I bought two [Samsung U28E590DS 28" 4K](https://www.amazon.com/gp/product/B00YD3DBOC/ref=as_li_qf_sp_asin_il_tl?ie=UTF8&tag=pablogonzal0b-20&camp=1789&creative=9325&linkCode=as2&creativeASIN=B00YD3DBOC&linkId=e2477167ece08b6bf894c113ba566186){:target="_blank"}.

## So many pixels

This was too much for my regular usage: web pages have over 60% blank space, SublimeText goes until the 325th column, etc. And using the default Unity tiling for the corners of the screen wasn't completely satisfactory, for code I like the full height but not more than half the width, and for others, a quarter of the screen was still too much.

That's where [xmonad](http://xmonad.org/) "the tiling manager that rocks" comes into play. It allows a whole new amount of configurations so you can tile your windows the way you need it.

## Have it your way

Right now my left monitor is split in two full height, 40-60 width, with Chrome windows, the leftmost one I use to research about what I'm doing[^4], the next one with the preview of this very post. My right monitor has the left half with Sublime where I'm writing this, the right half split in three, top one another Sublime with some code to reference, middle one a terminal with `mc` open and lastly another terminal with `jekyll` running where I also commit and push my posts.

And those are just the first two desktops, I have six open, each one with its own configuration that's the best for the task I'm doing at the moment.

The standard layout starts with two columns, one of which is the main. Each new window you open tiles it up into the non-main column. You can easily set (with a shortcut) how many windows in the main column and change into a row view, where all the windows that were into a column now are in a row, or a full-screen view, where the selected window goes full-screen. And, of course, amazing mouse support.

With simple shortcuts you can move through windows, reorder them, send them to other desktops, change desktop, change monitor, open new applications and anything you will need. And if you want something that isn't default, there are [hundreds of contrib modules](https://wiki.haskell.org/Xmonad/Config_archive) available, or you can create one yourself in Haskell.

If you're not completely happy arranging windows, give it a go. I'm sure you'll be surprised.

{% include footnotes.md %}

[^1]: According to my college records, this is an overstatement.
[^2]: I loved having dual monitors so much that I used it as the minimum requirement for work and I discarded any possible jobs were I would be forced to use only one. And I'm really glad that I did, but that's another story.
[^3]: I came here with two suitcases, one backpack and the three crates with my cats.
[^4]: At this very moment, what's the past simple of the verb 'split'. Because my dictionary complained about 'splitted'.
