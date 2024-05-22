# Suika Game
### Verlet Equation
X(n) = current position 
A(n) = Acceleration 
delta(t^2) = time 

X(n+1) = X(n)^2 - X(n-1) + A(n) x delta(t^2)
X(n+1) = X(n) + X(n) - X(n-1) + A(n) x delta(t^2)
*X(n+1) = X(n) + V(n) x delta(t)*

X(n) - X(n-1) = V(n-1)*detla(t) (The velocity from the objects previous position)

The equation is used to determine the next position of the cat's in my suika game, with constraints. 
The contraints are very basic ones: applying gravity, border constraints and collision with other cat's. 

### Game Mechanic 
You are basically going to merge cute cats and see how much points you can get. if the cat goes above the screen. Basically, try to spawn to cats at the same time. You lose. 

Point System: 
For ever merge, you get 2 * the level added into your points. so the smallest cat will give you 2 when you merge them and so on. 