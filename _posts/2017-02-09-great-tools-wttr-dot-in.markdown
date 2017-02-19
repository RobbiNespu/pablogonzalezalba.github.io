---
layout: post
title: "Great tools: wttr.in"
date: 2017-02-09 20:51:41 +0100
tags: a-post-a-day great-tools
---

Do you often find yourself working inside a terminal with access to the Internet but no web browser or a near smartphone and you really, really need to know how's the weather?

No?

Me neither. But I admit that doing `Alt+Tab` (or `Super+1, Super+o, Super+j,j,j, whatever I'll just grab the mouse` if you use [xmonad]({% post_url 2017-02-11-great-tools-xmonad %}) like me) to get to your browser is a little cumbersome.

## Enter wttr.in

There is no better introduction than looking at it. Go ahead, open a terminal and run `curl wttr.in`.

Here is how it looks for me right now:

![wttr.in output for Amsterdam on 2017-02-09]({{ site.url }}/assets/img/wttrin.jpg)

<sub><sup>If your city isn't automatically detected, you can specify it, for example: \`curl wttr.in/Amsterdam\`</sup></sub>

I love that it's going to snow. And I also love how nice [wttr.in](http://wttr.in) looks.

## Running in a terminal

This means that is simple and combinable. You can just run as is and see a nice summary of the weather. Or you can combine it with other tools to make it work exactly as you need it[^1]. I have created some aliases and bash functions to parse the results to use in different cases:

- When I start a new `zsh` shell, it shows me the weather for today only.
- In my [xmobar]({% post_url 2017-02-19-great-tools-xmobar %})[^2] I have a line that shows me the current temperature, sky conditions and precipitation.
- And, the most important, I aliased `alias weather="wget -qO - wttr.in/Amsterdam"` so, even through proxies, I have my city info and the result is easier to parse with other functions.

I'm glad to have this tool, that's very good on its own, but thanks to the modifications I made, I feel [the IKEA effect](https://en.wikipedia.org/wiki/IKEA_effect) in full and I like it even more.

{% include footnotes.md %}

[^1]: I know that there is a point where it should be easier to just grab another service with an API.
[^2]: Status bar for xmonad.
