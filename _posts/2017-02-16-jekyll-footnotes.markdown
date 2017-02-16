---
layout: post
title: "Jekyll: footnotes"
date: 2017-02-16 22:32:16 +0100
tags: a-post-a-day jekyll
---

When you write, sometimes, you need to add a reference or comment not directly related to the argument of the paragraph. Then you need a footnote.

## Adding footnotes in Markdown

Adding footnotes is quite simple: you call them anywhere adding a caret and the footnote number between brackets, like this: `{% raw %}[^1]{% endraw %}`. And here is how it looks: [^1].

Then, at the end of the page, you describe them using the same format, a colon and then the note, for example: `{% raw %}[^1]: This is a footnote{% endraw %}`.

## Styling

If you use [kramdown](https://kramdown.gettalong.org/) as your Jekyll Markdown parser, you already have some styles. Your theme may include some more, but Minima, the default one, doesn't.

I like how they look in general, but they seem to come just right after the text and at the same font size, so it can be confusing. To fix that I've created a small file `footnotes.md` that I put into the `_includes` subdirectory:

{% raw %}```
# footnotes.md
---
---
<sub></sub>
```{% endraw %}

The pair of triple dashes generate a nice[^2] looking double line, and the `{% raw %}<sub></sub>{% endraw %}` generates a small margin. Without that the footnotes are too close to the line, and with a `{% raw %}<br>{% endraw %}` the margin is too big.

I know this should be fixed with CSS, however I haven't touched the styles yet. When I decide to do so, I'll fix this. At least, having this in just one included file makes it much easier to change in the future.

You can see the result right here:

{% include footnotes.md %}

[^1]: Example footnote.
[^2]: At least for my taste.
