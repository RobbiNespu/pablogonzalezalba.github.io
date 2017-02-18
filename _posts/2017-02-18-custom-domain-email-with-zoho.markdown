---
layout: post
title: "Custom domain email with Zoho"
date: 2017-02-18 22:07:43 +0100
tags: a-post-a-day
---

Having your own custom domain inspires professionalism and it's really easy to set up.

## Custom domain

I've been using my current GMail address since 2009. It's a nice and simple address: my name at gmail dot com. It's probably good enough and I don't think I've ever lost an opportunity just because it's a GMail address[^1]. But it could be better.

I've bought [pablogonzalezalba.com](https://pablogonzalezalba.com)[^2] a couple of years ago and I've been using it to host my personal page. I recommend doing that since domains are quite cheap and they do improve your visibility a little. Even if you use to have a simple presentation of yourself and some links (Twitter, LinkedIn, etc.).

Considering I have the domain, it was about time I use it for email too. This has, also, the upside that I control the address: if, for example, Google were to close all GMail accounts, I could still use my email.

## Zoho

In the past, Google used to offer a free account for small Business that included a custom domain, but since then I've found that [Zoho](https://www.zoho.com/) has a free tier and it seems to work well enough. My needs don't require a $10 per month subscription but if, in the future, I do need them, I'll probably go with them since I've become used to their product[^3].

Creating an account is easy and it has detailed explanations and examples for all major DNS hosting providers. The main points are validating your domain, adding Zoho's MX name servers to your DNS provider and configuring your account/s.

It may take a while because of propagation, but I've been able to set up everything in 10 minutes and start using the new email. If this is going to be just for you, I suggest you create some aliases: My main username is `pablo@`, but I've also aliased `hi@`, `hello@` and `info@`. I can choose later which one to use in each occasion.

## Integrating with GMail

The truth is that I like GMail and I like Inbox even more. I use reminders all the time, I snooze emails and the search is incomparable, I don't care about folders or tags anymore, just search. So I'd like to keep using it as an interface and, luckily, it's also possible and easy to do.

In the account creation wizard you'll be presented with options to manage your account with an email application via IMAP, POP3 and SMTP. If you skipped that part, you can check it up again in the Control Panel.

On the GMail side, you have to go to Settings/Accounts and Import. There you should check `Check mail from other accounts` to get your emails there and, also, could be useful to add that account to `Send mail as`. Use the data provided by Zoho and your newly created user and password to connect both accounts.

That's it, feel free to try your new account by sending me an email to [hi@pablogonzalezalba.com](mailto:hi@pablogonzalezalba.com).

{% include footnotes.md %}

[^1]: I've never discriminated someone for their email address, but please, don't use something that includes words your mom won't let you say on the dinner table.
[^2]: Right now it just redirects to GitHub Pages where I host this blog, hopefully GitHub will allow people to use custom domains and SSL together.
[^3]: I don't get anything to say this, the link isn't a referral and I haven't ever talked with somebody at Zoho.
