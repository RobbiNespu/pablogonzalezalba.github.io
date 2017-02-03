---
layout: post
title: "Generating posts from the command line"
date: 2017-02-02 20:35:15 +0100
tags: a-post-a-day jekyll
---

I've been enjoying writing with Jekyll, Markdown is easy, it actually looks nice even before parsing and I can make all these changes with the interface that I choose.

The only problem I've found is that there are some requirements that are boring to fill up manually.

## Automate all the things

Each post requires an specific name: this one, for example, is called `2017-02-02-generating-posts-from-the-command-line.markdown`. In the content of the post, the title is repeated (this time with correct case and special characters), there is a `layout: post`, categories and also the date `2017-02-02 20:35:15 +0100`.

I really don't know the exact time when I start to write or when I finally push it. And the rest is tedious repetition. So let's fix that.

Looking around the internet I found that there is an official package: [Jekyll::Compose](https://github.com/jekyll/jekyll-compose) that adds some commands to Jekyll so you can `bundle exec jekyll post "My New Post"`. But it creates an empty post!

I kept looking and I found [this script](https://gist.github.com/ichadhr/0b4e35174c7e90c0b31b) that's more stand-alone, but works really well, it even opens Sublime Text to edit the newly created file! I've made my [own fork](https://gist.github.com/pablogonzalezalba/4535e5d536999815dd35494bd49e79b0) that fixes the only issue I had: it also prints out the date[^1].

And to make it even easier, I added this line to my aliases: `alias new_post="thor jekyll:new"` and this file was created with `new_post Generating posts from the command line`.

I probably have enough free time to lose a minute here and there to copy the title and write the date manually. However in the long run that boring stuff becomes heavier and heavier and all those minutes could have been better spent in something more meaningful. Also, it's nice to do something that requires to learn something new.

### Footnotes

[^1]: I know that technically it's not the published date but it's close enough. Maybe when I need to write longer posts if it's still a problem I'll find a solution.
