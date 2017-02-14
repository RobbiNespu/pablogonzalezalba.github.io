---
layout: post
title: "Jekyll: Create a page for a tag and its posts"
date: 2017-02-14 21:06:00 +0100
tags: a-post-a-day jekyll
---

Let's group all related posts into a single place.

## The problem

As you can imagine, there are many reasons to put connected posts together. I'm going to explain only my particular case, but it should be easy to adapt to any other similar usage.

If somebody asked me how to start their own blog, something that I've been writing about for some days, the easiest answer would be to point them to this blog. But where exactly?

- To the home? No, there are too many unrelated posts.
- To the [first post]({% post_url 2017-01-29-setting-up-jekyll-with-github-pages-in-5-minutes %})? That'd be a great start, but what if they want to continue?
- To the page with all the posts for the `jekyll` tag[^1]? That's almost there, but the usual order of these kind of pages is to show first the last post, and that would be the reverse of what I want to show to them.

Since none of the standard options seem to fulfill my needs, I've decided to continue with a custom page, that allows me to show anything I want, for example a custom introduction, in the format that I choose.

## Custom pages

To create a custom page, you need to create a new file, with `.html`, `.md` or any other supported extension, in the root of your blog, or even in any custom directory that you want. Probably you already have one, the `about.md` that Jekyll automatically creates for you.

You need to add some configuration to the file, as a minimum its layout and title, I've created mine with:

```
---
layout: page
title: Blog with Jekyll
permalink: /blog-with-jekyll/
---
```

Then in the body of the file, I've added a short introduction to the subject and the list of posts, in reversed order (oldest first) filtered by the tag `jekyll`. The code is really simple:

{% raw %}```
<ul>
  {% for post in site.posts reversed %}
    {% if post.tags contains 'jekyll' %}
      <li>
        <a href="{{ post.url }}">{{ post.title }}</a>
        —
        <span class="date">{{ post.date | date: "%B %-d, %Y"  }}</span>
      </li>
    {% endif %}
  {% endfor %}
</ul>
```{% endraw %}

[See the result here](/blog-with-jekyll). Note that the default layout, Minima, will show all your pages in the header. If you don't want that, you can create your own `header.html` specifying which pages to show and in which order.

This is one of the main advantages of Jekyll, you still have a lot of control and can, effortlessly, personalize your blog so it adapts to your needs instead of you adapting to it.

### Footnotes

[^1]: That page doesn't exist yet.
