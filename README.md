# Suika Game

Suika means Watermelon in Japanese. The original game tasks players with merging two of the same fruit to produce another fruit, with the final fruit being a watermelon. Once, your able to produce two watermelons, it will cycle back to the smallest fruit. My rendition of the game uses cats rather than fruit, because I thought cats were cuter.

I wanted to make the game alittle bit less quiet and added sound effects for everytime the cats merge together. But if you want background music too the game, I suggest this [BGM](https://www.youtube.com/watch?v=487Xz9y_f6w&ab_channel=%E3%81%AB%E3%82%83%E3%82%8B%E3%81%B1%E3%81%8BBGM%E5%B7%A5%E6%88%BF). But make sure you volume is high for the sound and that the background music is lowered. 

### Verlet Physics and its correlation with suika 

X(n) = Current Position
A(n) = Acceleration
delta(t^2) = time

X(n+1) = X(n)^2 - X(n-1) + A(n) x delta(t^2)
X(n+1) = X(n) + X(n) - X(n-1) + A(n) x delta(t^2)
**X(n+1) = X(n) + V(n) x delta(t)**

X(n) - X(n-1) = V(n-1)*delta(t) => Velocity from the object's previous position

The equation is used to determine the position of the next cat in my suika game, with constraints. The contraints are very basic ones: applying gravity, border constraints, and collision with other cats. So, knowing how verlet physics works and certain constraints, the production of suika game can be easily accomplished. 

To get a better understanding of verlet physics: This [video](https://www.youtube.com/watch?v=lS_qeBy3aQI&ab_channel=Pezzza%27sWork) will help and where I got the better understanding of it too. 

### How to play
**Goal:** The aim of the game is to merge cute cats and see how many points you can get.
You can click to spawn cats at the top of the screen which will drop and merge them with other cats of the same kind.
If the cat goes beyond the screen, you lose.

**Point System:** For every merge, you get (2 * cat level) added to your points. When you merge two of the smallest cat, you get 2 points, when you merge two of the second smallest, you get 4, and so on.

If you would like to run an application of the game, in processing go to file-> export application, pick which is right for you and add in the assets folder into the folder to play the game. Enjoy!!!

Here is a short demo of the game:

<video controls src="demo.mp4" title="Video"></video>
