---
layout: post
title: "Jekyll: Add pagination"
date: 2017-02-23 21:45:44 +0100
tags: a-post-a-day jekyll
---

There are too many posts in my home, let's take care of that.

First, if you're here because you need pagination, congratulations on your great number of posts, writing is not easy[^1]!

## Pagination with a plugin

Jekyll has a default plugin for pagination, `jekyll-paginate`, that, luckily, is accepted by GitHub Pages.

To enable it, you need to add it to your `Gemfile` and run `bundle install`. Then, you need to edit your `_config.yml` and add `paginate: 10` or the number of posts that you'd like to appear per page. Also, you can change the path that each page will, have, the default is `/page:num`. I prefer this slightly different version, with a dash separating the number: `paginate_path: "/page-:num/"`.

The last step is to create a new `index.html`, it won't work with Markdown or Textile files. You can find a [simple example](https://jekyllrb.com/docs/pagination/) on the official docs, however I found that it was better to start with my theme's home layout, so I could maintain the styles.

If you are using the Minima theme (the default one), I suggest to start with this base:

{% highlight html %}
{% raw %}
<ul class="post-list">
  {% for post in paginator.posts %}
    <li>
      <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>

      <h2>
        <a class="post-link" href="{{ post.url | relative_url }}">{{ post.title | escape }}</a>
      </h2>

      {{ post.excerpt }}
    </li>
  {% endfor %}

  <div class="pagination">
    {% if paginator.previous_page %}
      <a href="{{ paginator.previous_page_path }}" class="previous">&laquo; Previous</a>
    {% endif %}

    <span class="page_number">Page: {{ paginator.page }} of {{ paginator.total_pages }}</span>

    {% if paginator.next_page %}
      <a href="{{ paginator.next_page_path }}" class="next">Next &raquo;</a>
    {% endif %}
  </div>
</ul>
{% endraw %}
{% endhighlight %}

With this you'll have a minimal but functional pagination system for your blog.

Sadly, this plugin doesn't support tags or categories and is not under active development anymore. I've found [this one](https://github.com/sverrirs/jekyll-paginate-v2), that promises to be backwards compatible and has many more features. While it's not available to use on GitHub Pages, you can always build it in your local machine and just push the resulting files.

{% include footnotes.md %}

[^1]: This feels like I'm patting myself in the back, however I put the paginator with less than 30 posts so I doesn't really count.
