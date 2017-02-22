---
layout: post
title: "Jekyll: Automatic tags with git pre-commit"
date: 2017-02-22 21:22:24 +0100
tags: a-post-a-day jekyll
---

Following up on [yesterday's post]({% post_url 2017-02-21-jekyll-automatic-tags-page %}), let's automatize it more!

## What if I miss a tag?

The big problem with our previous solution for tags' pages was that we must create a new file for each new tag. If we forget about it, our tag wouldn't appear. Although we can make it appear anyway, it wouldn't have their own page with posts.

Since the idea is to run it with GitHub Pages, we can't run it with an external plugin. While there isn't a perfect solution, we can try to fix it locally. The following requires both Ruby and git, but if you're running Jekyll, you probably have those.

## Git hooks

Let's say you finish writing your post, what do you do now? You commit it. Here git can help us: [hooks](https://git-scm.com/book/gr/v2/Customizing-Git-Git-Hooks) are they way git provides us to execute custom scripts when certain actions occur.

In our case we can work with the `pre-commit` hook, that runs when we do `git commit`, but if the hook returns an error value (anything but 0) the commit won't be made. Inside the directory `.git/hooks` you should have a list of sample hooks, you can rename them (removing the `.sample` extension) to make them work, or you can create your own. The naming is important and, also, make sure that they are executable.

In our case, we want to check if the tags inside our posts match the tags in our `_my_tags` directory. There are many ways to do this[^1], but since we already have Jekyll, we can use it to parse the tags in a cleaner way[^2].

So I've created a hook, but only to call another script, this is my `.git/hooks/pre-commit`:

```
#!/bin/sh
MY_PATH="`dirname \"$0\"`"
$MY_PATH/../../_scripts/check_tags.rb
```

## Jekyll scripts

I haven't found many stand-alone scripts, and this doesn't feel big enough to be a plugin. So I created a `_scripts` directory and in there placed the `check_tags.rb` script. This script will actually check the tags and, if there are some missing, create them for us:

{% highlight ruby linenos %}
#!/usr/bin/env ruby
COLLECTION_NAME = 'my_tags'

ENV["JEKYLL_LOG_LEVEL"] = 'warn' # Ignore info output
require 'jekyll'

# Load site
site = Jekyll::Site.new(Jekyll.configuration)
site.read

# Read entries and remove the extensions
collection_tags = site.collections[COLLECTION_NAME].entries.map do |entry|
  entry.split('.')[0]
end

diff = site.tags.keys - collection_tags

if (diff.size > 0)
  puts "The following tags must be added to the `_#{COLLECTION_NAME}` directory:"
  puts diff.join(',')
  puts "I've created the files, just add them to the commit"

  diff.each do |tag|
    File.open("_#{COLLECTION_NAME}/#{tag}.md", 'w') do |file|
      file.puts "---"
      file.puts "slug: #{tag}"
      file.puts "name: " + tag.split('-').map(&:capitalize).join(' ')
      file.puts "---"
    end
  end
  exit 1
end
{% endhighlight %}

Figuring out how to do it wasn't exactly straightforward, but still not complicated, since Jekyll is [open source](https://github.com/jekyll/jekyll) and the code is easy to follow. Some observations about the code:

- Line 4: Jekyll has some unnecessary (for us) output in the default `info` level.
- Lines 8-9: we need to start the site, but also `read` from it before being able to use the other methods.
- Line 16: It'll check that the tags in the post are also in the `_my_tags` directory, it won't complain if there are files in there that aren't used as tags in posts, since this isn't visible.
- Line 27: The tag will have a default name, for example `this-is-a-tag` becomes `This Is A Tag`, if you don't like the name, you'll have to change it manually.
- It won't auto-add the files, you have to add them and commit again.
- Since it runs locally, it doesn't know if the files are committed or not. So if you create the tag, but don't commit it, this script won't notice it.

This is still far from perfect, however it fulfills my needs. If I ever forget a tag, interrupting my commit step and telling me about it is enough. I can then check if the name is okay and commit with the new file.

Sometimes we are bound by external limitations, however there are many ways to modify our local workflow so these don't affect us, git hooks is just one of many tools available to help us.

{% include footnotes.md %}

[^1]: Text parsing and regexps if you love those. They're probably faster, but in a blog you shouldn't notice a big difference.
[^2]: This makes me think, since it's so easy, why wouldn't they do it already?
