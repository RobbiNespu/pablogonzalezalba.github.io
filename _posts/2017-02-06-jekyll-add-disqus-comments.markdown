---
layout: post
title: "Jekyll: Add Disqus comments"
date: 2017-02-06 21:32:58 +0100
tags: a-post-a-day jekyll
---

Adding comments to your blog is something very important to create a community and invite people to come back again. Also it's a way to learn: how else are they going to teach you how wrong you are if you don't allow interaction?

## Choosing a platform

Long gone are the days where you had to maintain your own system. Moderating and preventing spam are already built-in in all the usual comment platforms.

The most common and, probably, available to your visitors is [Facebook comments](https://developers.facebook.com/docs/plugins/comments/). However, not being much of fan myself, I decided to go with the next big thing: [Disqus](https://disqus.com/). There are many other options, paid and free, so I encourage you to find the one you like the most.

If you choose to go with Disqus, the setup is really simple.

## Disqus in 2 minutes

1. [Create an account](https://disqus.com/profile/signup) and choose "I want to install Disqus on my site".
2. Follow the 3 easy steps to put your info and a very minimal configuration.
3. Get either your `unique identifier` or your `Universal Embed code`.
4. The Universal Embed code is just a piece of JavaScript code that you're supposed to put on your pages, but if you're using one of the themes of Jekyll (for example, Minima, the default one) you probably have already that sorted out for you[^1].
5. Edit your `_config.yml` file to make the comments appear. You'll need at least your `disqus.shortname`, but I also added a [default variable](https://jekyllrb.com/docs/configuration/#front-matter-defaults) to set comments on all pages of type post, check my additions below:

```
disqus:
  shortname: pablogonzalezalba-1
defaults:
  -
    scope:
      path: ""
      type: "posts"
    values:
      comments: true
```

And that's it. Now you are able to receive comments and talk with your followers.

{% include footnotes.md %}

[^1]: If you don't, copy it from the [Minima repository](https://github.com/jekyll/minima/blob/master/_includes/disqus_comments.html).
