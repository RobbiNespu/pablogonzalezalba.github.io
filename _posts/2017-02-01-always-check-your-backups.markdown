---
layout: post
title: "Always check your backups!"
date: 2017-02-01 21:28:04 +0100
categories: a-post-a-day backups
---

Everyone knows how important is to have backups, but how many times do you test your backups? Have you tested them *at all*?

## If you don't tests your backups, you don't have backups

This post is inspired by the let's-hope-it-catches-up [Check your backups Day (February 1st)](http://checkyourbackups.work/), in time inspired by the [GitLab.com Database Incident](https://docs.google.com/document/d/1GCK53YDcBWQveod9kfzW-VCxIABGiryG7_z_6jHdVik/pub):

> So in other words, out of 5 backup/replication techniques deployed none are working reliably or set up in the first place.

If it happens to the awesome people of GitLab, it can happen to you too. It happened to me twice:

The first time happened when I was a kid. At that time I used to write a lot, I had wrote a couple of short stories, even shared some of these with other people online. They weren't great, but they were mine, and they had a couple of nice comments too.

Until one day I needed to format my PC, so I backed everything up in a CD and formatted away. A couple of hours later, I was copying everything back to my disk, however my one of my stories wasn't there. I'm not exactly sure what happened, if I failed to select a folder to copy or what, the truth is that I never checked the contents of the CD, I just trusted everything was there. Luckily it was almost everything, it could've been worse, but that was my latest story, not yet "published".

I can't just point to this event and say it was the definitive reason, starting high school probably had more of an effect. However after that I never wrote a short story again.

The last time was a year ago, with my previous blog. I didn't write much, I don't think anyone ever read anything, but I had a couple of post in there useful to me, as a reminder. I had setup my own WordPress blog (probably my first mistake) into the same VPS that hosts my personal web. I got so used to make the changes to my web in my local machine and then publish with just one command[^1] that I forgot this was a database and should be backed up regularly.

One day I decided to change VPS provider, so I deleted my instance. I took only 5 seconds to realize my mistake, however it was too late. I tried both Google cache and [Web Archive](https://archive.org/web/) without results. And I took almost a year to recreate my blog and start writing again.

Maybe the lesson here is to [never give up](https://www.youtube.com/watch?v=dQw4w9WgXcQ) and keep working through adversities. But let's return to backups.

## It's 11:00 pm do you know where your backups are?

Take a couple of minutes of your time and check all your backups now, even the ones in the cloud, *specially* the ones in the cloud.

- Where are the photos of your wedding, of your kids or grandkids? Is Picasa/Google Photos/Dropbox enough?
- Where are your personal projects, your book/memories/million-dollar-idea/next startup?
- Where are your emails? Do you use Gmail (like a billion people)? Do you know that if they suspend your account, for any reason, you lose everything? Just google "google suspend account", learn from some horror stories and [back up your data now](https://support.google.com/accounts/answer/3024190?source=gsearch&hl=en).
- Where are your work files? Does your company have a good backup process? Why don't you try it? If it's perfect, you'll probably learn some good practices, if it isn't, you can be the one that finds the hole and saves millions for the company, don't forget to put it into your resume.

If you care about it, back it up, then grab that backup and recover it, make sure that everything it's in place, and do it periodically, you won't regret it.

### Footnotes

[^1]: That's a good idea for another blog post: get used to automatize everything.
