---
layout: post
title: "Generating your resume with LaTeX"
date: 2017-02-20 20:55:49 +0100
tags: a-post-a-day
excerpt: <p>Having a resume that looks nice everywhere is very important, and you can generate one easily with LaTeX.</p>
---
<script type="text/javascript"
  src="http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>

Having a resume that looks nice everywhere is very important, and you can generate one easily with $$\LaTeX$$.

## What is LaTeX?

[LaTeX](http://www.latex-project.org) is a document preparation system that enforces a separation of concerns between the content and the formatting. It encourages authors to worry only about the former, leaving the latter to document designers. The official page has this nice example about a sample article:

```
\documentclass{article}
\title{Cartesian closed categories and the price of eggs}
\author{Jane Doe}
\date{September 1994}
\begin{document}
   \maketitle
   Hello world!
\end{document}
```

However some people avoid using it, since most example code really looks like this:

{% highlight latex linenos %}
\begin{gather*}
  \begin{split}
    b_n=\frac{1}{\pi}\int\limits_{-\pi}^{\pi}f(x)\sin nx\,\mathrm{d}x=
    \frac{1}{\pi}\int\limits_{-\pi}^{\pi}x^2\sin nx\,\mathrm{d}x
  \end{split}\\[6pt]
\end{gather*}
{% endhighlight %}

But that's only because it's really awesome to use in Math and other sciences, that piece of code generates this beauty:

$$
\begin{gather*}
  \begin{split}
    b_n=\frac{1}{\pi}\int\limits_{-\pi}^{\pi}f(x)\sin nx\,\mathrm{d}x=
    \frac{1}{\pi}\int\limits_{-\pi}^{\pi}x^2\sin nx\,\mathrm{d}x
  \end{split}\\[6pt]
\end{gather*}
$$

And if we analyze it, starting from line 3:

- **b** -> The letter 'b'
- **_n** -> Subscript with the letter 'n'
- **=** -> The equal sign '='
- **\frac{1}{\pi}** -> A fraction, with numerator '1' and denominator 'pi'
- **\int\limits_{-\pi}^{\pi}** -> An integral, with limits '-pi' to 'pi'
- ...

It actually makes a lot of sense, it's a language easy to learn and becomes more useful. To be honest, 90% of the time you don't have to remember anything, you copy it from a source file that has something similar to what you need[^1].

And, if you don't need hard mathematical equations, it's much simpler.

## Generating your resume

I have found [an excellent sample resume](https://gist.github.com/pablogonzalezalba/645309e7937f0f55dd6a818460cc657d){:target="_blank"}[^2]. As you can see, there are very few keywords and it's mostly just content. And here's the [compiled version]({{ site.url }}/assets/pdf/sample-resume.pdf){:target="_blank"}, it does look nice, doesn't it?

For my [personal resume]({{ site.url }}/resume.pdf){:target="_blank"}, I've edited a copy, added a couple more fields, a personal introduction and touched a little the design. But the format is still based in that sample.

Once you've prepared it, you need to convert it to PDF. There are countless tools to do so, however if you use Linux, you probably have access to the package `texlive-full` that include the application `pdflatex`. Then you can just run it with `pdflatex my-resume.tex` and it'll output in the same directory `my-resume.pdf`. Being the source file plain text, you can easily add it to version control and see differences, even create separated ones for specific companies.

Now you can forget about design and styles[^3] and focus only in the content, that should be the most important part of your resume.

{% include footnotes.md %}

[^1]: That also applies to programming.
[^2]: Sadly, I can't find the source anymore, but I'll be glad to point it to the actual creator because I love the simplicity and professionalism it inspires.
[^3]: Unless you are a designer, then maybe your resume is another example of your work.
