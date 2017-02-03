---
layout: post
title: "Jekyll: Change categories to tags"
date: 2017-02-03 23:13:41 +0100
tags: a-post-a-day jekyll
---

So it seems that Jekyll categories are part of the generated URL, so a post would look like `/category1/category2/yyyy/mm/dd/post-title.html`.

That may be useful for many different cases, not mine, however. If you have more than one category, you'll have to put them always in the same order (or just don't care if it looks ugly).

Tags aren't actually displayed anywhere in the page (neither are categories, but at least them are in the URL) so we have to add them. There are a couple of plugins and examples online, but it's actually a good opportunity to check how to customize the post page.

Since they will also need a page/section to show all the tags and another to show posts by tag, I've decided to investigate more another day, however I could start displaying them with just this simple line: {% raw %}`{{ page.tags | join: ' – ' }}`{% endraw %}
