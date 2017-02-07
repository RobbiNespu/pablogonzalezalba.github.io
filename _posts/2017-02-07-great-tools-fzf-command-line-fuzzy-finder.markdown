---
layout: post
title: "Great tools: fzf - command line fuzzy finder"
date: 2017-02-07 22:50:05 +0100
tags: a-post-a-day great-tools
---

One of the best features of [SublimeText](https://www.sublimetext.com/) is their "Goto Anything". If you know it, you love it, if you don't:

Goto Anything is used to open files with only a few keystrokes. You invoke it with `Ctrl+P` then start writing part of the filename and, this is the magic part, it'll fuzzy match it with amazing results.

## Fuzzy matching

For example, let's say I was investigating for my [previous post]({% post_url 2017-02-06-jekyll-add-disqus-comments %}) how does Minima, the default theme, show Disqus comments. I only know that the theme is installed in my gems, the name is minima and it'll probably say something about Disqus.

With that, I press `Ctrl+P` and I type `minimadisq`. In less than one second I get my answer:

`.rvm/gems/ruby-2.4.0/gems/minima-2.1.0/_includes/disqus_comments.html`

And situations like this happen all the time, you need to open a file that you only know by name, but may be behind a couple of directories that you don't quite remember or you only remember the lib/directory name but not exactly the file or you don't know the extension, etc. There are tons of cases where the fuzzy matching saves you a lot of time searching.

Until recently, I only used it inside SublimeText. However, you can imagine that I had the same issues outside it, when using commands like `ls`, `tail`, `rm`, `git`, etc.

## fzf

Here comes [fzf - command line fuzzy finder](https://github.com/junegunn/fzf). It's the same idea applied to the command line.

You can read the usage for the main executable but I use it mainly in two ways:

### Autocomplete

Instead of the standard bash autocomplete that just looks at files/executables starting with what you already wrote, if you add `**` at the end and press `Tab` you get `fzf` fuzzy autocomplete, for example:

```
$ ls somdir**<Tab>
# brings you `fzf` that will match something like
$ ls some/really/deep/directory/
```

### History search

This is the one that I, personally, use and like the most. Instead of the regular `Ctrl+R` backwards history search, you can set it up to use `fzf` and do a fuzzy search in your history. It's specially useful for most of the long and hard commands, since they are, probably, used more than once, but not so much to make yourself remember them.

I use this tool multiple times a day, at work and at home. So much that I don't know how I used to be able work at all before I found it.

The only downside is that now I remember even less the full path of files, and when my coworkers ask me for a path, I usually answer with just the small pieces that I know I could input into `fzf` to get it. However, they usually ask again, then I present them with this tool and they love it too.
