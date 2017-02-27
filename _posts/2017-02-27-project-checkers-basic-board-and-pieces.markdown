---
layout: post
title: "Project Checkers: Basic board and pieces"
draft_date: 2017-02-27 21:50:54 +0100
date: 2017-02-27 22:39:40 +0100
tags: a-post-a-day project-checkers
---

Let's display the board on the screen.

## Rendering

Last time when [I made the Tetris]({% post_url 2017-02-04-programming-for-fun-making-a-tetris-game %}), one of my biggest issues was not knowing if my first steps in the code were working properly. I could have created some tests, but I still wasn't even sure how it was supposed to look like.

So this time I've decided to start displaying the board. In the simplest way possible to not lose too much time and, definitively, not get locked into that implementation. It may be because I'm more of a visual learner, because I've found that an early rendering of stuff helps me grasp what I'm doing.

Spoilers, this is how it looks right now:
![Checkers]({{ site.url }}/assets/img/checkers_board.png)

## How to generate the board

You can check the [full source code](https://github.com/pablogonzalezalba/checkers) at any moment, I'm going to go over some of the most important details.

My complete hardcoded board state is just an array of arrays of objects:

{% highlight javascript %}
const board = [
  [{},{color: 'dark'},{},{color: 'dark'},{},{color: 'dark'},{},{color: 'dark'}],
  [{color: 'dark'},{},{color: 'dark'},{},{color: 'dark'},{},{color: 'dark'},{}],
  [{},{color: 'dark'},{},{color: 'dark'},{},{color: 'dark'},{},{color: 'dark'}],
  [{},{},{},{},{},{},{},{}],
  [{},{},{},{},{},{},{},{}],
  [{color: 'light'},{},{color: 'light'},{},{color: 'light'},{},{color: 'light'},{}],
  [{},{color: 'light'},{},{color: 'light'},{},{color: 'light'},{},{color: 'light'}],
  [{color: 'light'},{},{color: 'light'},{},{color: 'light'},{},{color: 'light'},{}]
];
{% endhighlight %}

I haven't thought about how the real board object will work, but it will be very similar to that, or export into it, so it can be passed to the React `<Board board={board} />` object to display it. Let's see how it looks like:

{% highlight javascript linenos %}{% raw %}
export default class Board extends Component {
  render() {
    const {width, height} = Dimensions.get('window');
    const minDimension = (width < height ? width : height) - margin * 2;

    return (
      <View style={{...styles.board, width: minDimension, height: minDimension}}>
        <View style={{flex: 1, flexDirection: 'column'}}>
          {this.renderRows(minDimension / 8)}
        </View>
      </View>
    );
  }

  renderRows(size) {
    let color = boardBackgroundDark;
    const rows = this.props.board.map( (row, rowIndex) => {
      const blocks = row.map( (man, squareIndex) => {
        color = color == boardBackgroundDark ? boardBackgroundLight : boardBackgroundDark;
        return (
          <Square color={color} size={size} key={squareIndex}>
            {man.color ? <Man color={man.color == 'light' ? manBackgroundLight : manBackgroundDark} size={size /2 } /> : <View />}
          </Square>
        );
      });
      color = color == boardBackgroundDark ? boardBackgroundLight : boardBackgroundDark;
      return <View key={rowIndex} style={{flex: 1, flexDirection: 'row'}}>{blocks}</View>;
    });

    return rows;
  }
}
{% endraw %}{% endhighlight %}

<sub><sup>Sorry for the weird highlighting, it doesn't seem to work well with JSX yet</sup></sub>

As you can see, most of the code is styling, making the board square (lines 3-4), calculating the size of each of the internal objects (lines 9, 22), intercalating their colors (lines 16, 19, 26) and choosing whether or not to display a *man*[^1] and its color (line 22). The `<Square />` and `<Man />` are even simpler, just views with styles.

In the end, it took me just a little more than an hour to produce and now, each change to the functionality, movements or anythings else that I make, I can see it on my screen to be more confident that I'm in the right path and be able to catch bugs early.

Join me next time to continue with this fun project.

{% include footnotes.md %}

[^1]: I'm using the naming found in [Wikipedia](https://en.wikipedia.org/wiki/Draughts) because names change a lot by regions and I want to use something as "official".
