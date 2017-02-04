---
layout: post
title: "Programming for fun: Making a Tetris game"
date: 2017-02-04 23:09:02 +0100
tags: a-post-a-day
---

Sometimes I feel like doing a little programming, just for fun, but I don't have any project at the moment. One day I asked a friend what to do, and he randomly said **Tetris**.

## Why doing something that already exists?

Because you already have the specification! Tetris in an excellent game for this. Almost everyone knows how it works, it's simple enough to be done in a short time and you'll finish with something cool to show to your friends.

You remove the initial product design and go directly to the architecture. Every Tetris will need:

- A grid design: 19x10 is the original one.
- Some pieces: the [Tetrominos](https://en.wikipedia.org/wiki/Tetromino). There are 7 different combinations with 4 blocks each.
- Movement: the current piece will move down by one row in a determinate amount of time, and also will rotate and move to the sides.
- User interaction: the minimum is to move left and right, and to rotate.
- Game logic: filled up rows disappear and if you get to the top you lose.

That's the bare minimum but results in a working game.

## Lessons learned

You'll be surprised in how much you'll learn with this simple exercise. You can use it to learn a new language, to go deeper in one you already know or to play with data structures and design patterns.

I've done this two times, the first one was in Ruby: [terminal-tetris](https://github.com/pablogonzalezalba/terminal-tetris).

While I've worked a lot with Ruby in the past, it was mainly in a Ruby on Rails application or scripts. I learned a lot about how to create an application that runs on the terminal, receiving user input and displaying a "nice" text-based graphics.

The other was with JavaScript and React: [tetris-react](https://github.com/pablogonzalezalba/tetris-react).

I played around with React a couple of times before, but this was the first time since they've launched [create-react-app](https://github.com/facebookincubator/create-react-app) that really simplifies the process from nothing to a working system.

In both cases I thought about how to keep the current state, manage collisions and other interesting issues.

## Going on

After you've made the minimal Tetris, now you have a working project to keep improving. There are tons of modifications and upgrades that you can add. I'll mention a few:

- Calculate the score by counting how many lines you clear. Make it better to clear more lines in one go.
- Make it go faster after each cleared line.
- Persist scores with names.
- Improve the display. Make it more pretty, or simply add more things: show the next piece before it appears, show the top scores.
- Change the size of both the grid and the pieces. Have you made any assumptions about this in the code? Think about how much you'll have to change and then think if there is a way to decouple it more.
- Add more controls. Rotate to the other side, go down faster, restart the game, quit the game.
- Refactor the code, add comments. Look at it in again in a couple of months and see if you've made a good job.
- Start again in a different language or system.
- Etc.

There are endless ways to keep working on it. And if you get tired of Tetris, there are many other games that you can clone. Try a 2 person game. Try one with an AI (maybe start with something simpler than Chess). And then go one step beyond and think your own game with your own rules. The future is yours to make.
