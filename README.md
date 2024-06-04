# Suika Game

Suika means Watermelon in Japanese. The original game tasks players with merging two of the same fruit to produce another fruit, with the final fruit being a watermelon. Once, your able to produce two watermelons, it will cycle back to the smallest fruit. My rendition of the game uses cats rather than fruit, because I thought cats were cuter.

### Verlet Physics and its correlation with suika 

X(n) = Current Position
A(n) = Acceleration
delta(t^2) = time

X(n+1) = X(n)^2 - X(n-1) + A(n) x delta(t^2)
X(n+1) = X(n) + X(n) - X(n-1) + A(n) x delta(t^2)
**X(n+1) = X(n) + V(n) x delta(t)**

X(n) - X(n-1) = V(n-1)*delta(t) => Velocity from the object's previous position

The equation is used to determine the position of the next cat in my suika game, with constraints. The contraints are very basic ones: applying gravity, border constraints, and collision with other cats. So, knowing how verlet physics works and certain constraints, the production of suika game can be easily accomplished. 

### How to play
**Goal:** The aim of the game is to merge cute cats and see how many points you can get.
You can click to spawn cats at the top of the screen which will drop and merge them with other cats of the same kind.
If the cat goes beyond the screen, you lose.

**Point System:** For every merge, you get (2 * cat level) added to your points. When you merge two of the smallest cat, you get 2 points, when you merge two of the second smallest, you get 4, and so on.

Here is a short demo of the game:

<video controls src="demo.mp4" title="Title"></video>

