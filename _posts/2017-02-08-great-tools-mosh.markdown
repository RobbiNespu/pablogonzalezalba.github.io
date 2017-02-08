---
layout: post
title: "Great tools: Mosh"
date: 2017-02-08 21:40:53 +0100
tags: a-post-a-day great-tools
---

When I lived in Argentina I had to endure some less than ideal Internet providers. The worst one was on one of my jobs and it had constant package droppings and just straight out cuts. We would lose connection for a couple of seconds every 5 minutes or so.

Well, that's not that bad, is it? Just couple of seconds here and there is not going to kill your productivity... Unless you're SSHing into a remote server.

We started using `screen`/`tmux`, however sometimes we had to check something and we'd forgot about it, until the dreaded connection error.

## **MO**bile **SH**ell

Enter [Mosh](https://mosh.org/), the mobile shell. It's a replacement for `ssh`, most of the time you won't notice a difference, but when you, temporarily, lose the connection, you'd be glad to have it. These are the main features:

- When your connection is back up, you won't notice it ever was out happened at all.
- Instant feedback, you can continue writing your command and seeing what you're writing while it tries to reconnect you.
- All connections are good to go: disconnect your ethernet cable at home, use your LTE on the go, then connect to wifi at work, your session is still up.
- You can now safely sleep your laptop.
- And it doesn't even require root access.

Dutch ISPs are better at delivering a stable connection, however because of wifi issues and be able to send my laptop to sleep, I keep using Mosh the same. And I suggest you do the same, like a plunger, it's better to have it before you need it[^1].

### Footnotes

[^1]: According to [Reddit](https://www.reddit.com), this is like the meme for best advice ever.
