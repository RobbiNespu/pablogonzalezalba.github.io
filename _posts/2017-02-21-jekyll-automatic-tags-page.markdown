---
layout: post
title: "Jekyll: Automatic tag's page"
date: 2017-02-21 22:19:07 +0100
tags: a-post-a-day jekyll
---

Let's simplify the navigation by linking tags to a page with all other posts with the same tag.

## A page for each tag

In a [previous post]({% post_url 2017-02-14-jekyll-create-a-page-for-a-tag-and-its-posts %}) I wrote about how to create a custom page for all my posts about [blogging with Jekyll](/blog-with-jekyll). However that was custom for each tag.

Since we are limited in the [available plugins](https://pages.github.com/versions/) for GitHub Pages, I've found this [really good solution](http://www.minddust.com/post/alternative-tags-and-categories-on-github-pages/) and adapted it to my needs.

### 1. Collections

Jekyll also allows a new type of document (different from posts or pages): [collections](https://jekyllrb.com/docs/collections/). In order to use a collection for the tags, we must add the following code to `_config.yml`:

```
collections:
  my_tags:
    output: true
    permalink: /tag/:name/
```

`my_tags` is just the name I gave the collection, `output: true` means that each element of the collection will be its own page, and the `permalink` specifies how the URL will look like.

Then we create a directory called `_my_tags` (Note the preceding underscore before the chosen name!) and in there we will create a file for each tag[^1]. Each file will only have a [front matter](https://jekyllrb.com/docs/frontmatter/), for example:

```
---
slug: jekyll
name: Jekyll
---
```

### 2. Post layout

Now we can change the plain tags to links to their new pages. We'll find the tags of the current post in `page.tags`, and all our defined tags in `site.my_tags`. And we can match them using `| where`, which returns an array so we only take the first element. As it's shown below:

{% highlight html %}
{% raw %}
{% for post_tag in page.tags %}
  {% assign tag = site.my_tags | where: "slug", post_tag %}
  {% if tag %}
    {% assign tag = tag[0] %}
    <a href="{{ tag.url }}">{{ tag.name }}</a>
  {% endif %}
{% endfor %}
{% endraw %}
{% endhighlight %}

This will only show tags that already exist in the `_my_tags` directory with their corresponding link, so we need to make sure that any new tag is also created in there.

### 3. By-tag layout

For the tag pages, we need a new layout. We can find all the matching posts inside `site.tags[page.slug]`. Here's a simple example about how to do that and, also, my current `_layouts/by-tag.html`:

{% highlight html %}
{% raw %}
---
layout: default
---
<h2>{{ page.name }}</h2>
<ul>
  {% for post in site.tags[page.slug] %}
    <li>
      <p>
        <a href="{{ post.url }}">{{ post.title }}</a>
        —
        <span class="date">{{ post.date | date: "%B %-d, %Y" }}</span>
      </p>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>
{% endraw %}
{% endhighlight %}

Finally, in `_config.html` we indicate that all files inside `_my_tags` should use this new `by-tag` layout:

```
defaults:
  -
    scope:
      path: ""
      type: my_tags
    values:
      layout: by-tag
```

And that's it, we have a GitHub Pages-compatible page for our tags. If you use categories, the process is exactly the same. And you can even create pages for collections that aren't related to the posts, so give it a try.

{% include footnotes.md %}

[^1]: Yes, this sounds repetitive and boring, but we are limited by what GitHub Pages provides. An alternative is to install any plugin, compile the code locally and publish the resulting processed blog. And, also, I'm still looking for other solutions[^2].
[^2]: Check [my new alternative]({% post_url 2017-02-22-jekyll-automatic-tags-with-git-pre-commit %})
