---
layout: post
title:  "Setting up Jekyll with GitHub pages in 5 minutes"
date:   2017-01-29 11:40:07 +0100
categories: jekyll github meta
---
I've finally decided for a new blog setup: [Jekyll](http://jekyllrb.com) inside [GitHub pages](https://pages.github.com/).

## Why Jekyll?

- Ease of use, install in 2 minutes, create a new file for a new post.
- A lot of control on the results, use themes or manage your own CSS.
- The simplest backups possible with git.
- All while not having to having to worry about backend security issues and upgrades: the result is just plain HTML.

## Why GitHub pages?

- They work out of the box with Jekyll.
- You don't have to worry about anything server-side.
- It's free!

## Getting started

I tend to procrastinate a lot, so I wanted to just start writing and then configure everything afterwards. Jekyll allows you to do this, but the [official docs](http://jekyllrb.com/docs/home) are comprehensive and, honestly, quite long.

Other unofficial tutorials also take some time in extra configuration, that's definitely useful, but for some people, like me, it's just another excuse to postpone the actual writing, this is the guide that I'd have liked to have when I started.

This post won't explain everything and will assume have [RubyGems](https://rubygems.org/pages/download) and [Git](https://git-scm.com/) and know how to use them.

## Let's get started

1. Create an account on [GitHub](https://github.com/)
2. Create a [new public repository](https://github.com/new) and name it `YOUR_USERNAME.github.io` (change YOUR_USERNAME for your actual GitHub username) but don't initialize it (Jekyll doesn't like to work on non-empty directories [^1])
3. Install Jekyll and Bundler with `gem install jekyll bundler`
4. Create your new local blog with `jekyll new DIRECTORY_NAME`
5. Make it a git repository connected to your GitHub account with `git init .` and then `git remote add origin https://github.com/USER/REPO.git`
6. Commit everything that's uncommited and push (Jekyll creates a .gitignore so you can only add the required files)
7. That's it, go to https://YOUR_USERNAME.github.io and see your new blog! [^2]

After that you can (or should) edit your `_config.yml` and start looking around to change styles, however if you just want to write, you can do that and see your results live.

Since I haven't done much more configuration myself just yet, expect future posts on how to improve your new blog.

### Footnotes

[^1]: If you did it, the easiest way to continue is to clone it in to your local machine, delete all the contents (usually just a README, LICENSE and .gitignore), run `jekyll new ./` and then just undelete the files with `git checkout --`.
[^2]: The first time it may take a couple of minutes to appear. In my case it was less than 1, but I've read that it can take up to 5.
