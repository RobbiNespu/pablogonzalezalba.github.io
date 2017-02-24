---
layout: post
title: "Jekyll: Drafts"
draft_date: 2017-02-24 22:19:07 +0100
date: 2017-02-24 23:08:12 +0100
tags: a-post-a-day jekyll
---

Sometimes you need a place to start writing, but you are not going to publish it yet. Then you need a draft.

## Drafts

You're probably used to drafts in emails, you start writing and don't send it, it'll automatically (or manually) be saved in a draft folder to edit or send later. However, since Jekyll publishes everything, you can't just start writing a post inside `_posts/` as you would usually do. You have to start with a draft inside `_drafts/` and then publish it.

There is some controversy around this: Jekyll supports the draft folder, but you have to do everything manually.

Ben Balter, a contributor of Jekyll, [says here] that he'd like to deprecate drafts altogether because you can achieve the same effect with git's branches workflow, leaving "drafts" in a branch until you decide to merge and publish.

There is also [Jekyll::Compose](https://github.com/jekyll/jekyll-compose) to add a command line interface however, [as I said before]({% post_url 2017-02-02-generating-posts-from-the-command-line %}), that solution didn't work so well for me, although when using a full draft workflow it seems to be quite useful, so I suggest giving it a chance.

My workflow is not so defined, most of the times I just need to create a post and I'll work on it continuously until finishing. But there are other times when I'm just investigating or creating a post that takes many days to complete. In that case I need a place to gather my thoughts and leave links to follow up later.

Luckily, Jekyll is very flexible so we can make our own choices for any step of the writing and publishing process.

## Custom script

Again, [I'm using a custom Thor script]({% post_url 2017-02-02-generating-posts-from-the-command-line %}) to create a new post. I've edited it so it can also work with drafts.

The first change was to allow to create drafts, so I added a `method_option` that will choose in which directory to create the post, and whether to add the date to the filename or not:

{% highlight ruby %}
method_option :draft, :type => :boolean, :aliases => "-d"
...
prefix = options.draft? ? "_drafts/" : "_posts/#{date}-"
filename = "#{prefix}#{title.to_url}.markdown"
{% endhighlight %}

Then I created a new method to publish a draft. It'll take a post inside `_drafts/`, put the current date and move it to `_posts/`. As an extra detail, it'll keep the original created date as the variable `draft_date`, you never know when knowing that might be necessary.

{% highlight ruby %}
desc "publish", "publish a draft"
  def publish(draft_filename)
    if not File.exist?(draft_filename)
      abort("#{draft_filename} doesn't exists!")
    end

    content = File.read(draft_filename)
    content = content.gsub(/draft_date: (.*)/, "draft_date: \\1\ndate: #{title_date}")
date: 2017-02-24 23:08:12 +0100

    post_filename = "_posts/#{filename_date}-#{draft_filename.split('/').last}"

    File.open(post_filename, "w+") do |post|
      post.puts content
    end

    File.delete(draft_filename)
  end
{% endhighlight %}

Now I can either create a post like I used to, or create a draft, work on it and, when I'm done, publish it with `thor jekyll:publish _drafts/draft-name.markdown` or, as I've aliased, `publish_post _drafts/draft-name.markdown`.

If you now believe that you could use drafts, try any of the options I suggested, or make your own based on my [updated gist](https://gist.github.com/pablogonzalezalba/4535e5d536999815dd35494bd49e79b0).
