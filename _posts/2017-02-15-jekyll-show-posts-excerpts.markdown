---
layout: post
title: "Jekyll: Show posts' excerpts"
date: 2017-02-15 22:02:55 +0100
tags: a-post-a-day jekyll
---

This text right here is the excerpt of the post. And I'm going to explain how to make it appear in your lists of posts.

## Excerpts in Jekyll

If you have an index of your posts, and want to show a little more than the title, to preview the full content, you can show the `excerpt`.

In Jekyll, all posts have, by default, an automatically created excerpt with the first paragraph of the post. If you'd like to include more (or less) content, you can set an arbitrary limit by adding the variable `excerpt_separator` to the [front matter](https://jekyllrb.com/docs/frontmatter/). The excerpt will become everything from the beginning of the post until the separator. You can also add the `excerpt_separator` to your `_config.yml` for it to work in all of your posts.

In order to show it, use the `post.excerpt` in your index, or any other file in which you list posts. Here's a code sample:

{% raw %}```
<ul>
  {% for post in site.posts %}
    <li>
      <p><a href="{{ post.url }}">{{ post.title }}</a></p>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>
```{% endraw %}

If you want to preview the result, I'm currently using it in the [Blog with Jekyll collection](/blog-with-jekyll).

I'm sure you can think were you would need to show an excerpt and I hope this post was useful to implement it.
