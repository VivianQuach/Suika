/*
1st: Understanding Verlet Equation: 
  X(n+1) =X(n) + X(n) - X(n-1) + A(n)*delta(t^2)
  X(n) - X(n-1) = V(n-1)*detla(t) (This is the velocity from the object previous position)
  X(n+1) = X(n) + V(n)*delta(t) (this is produces when you factor out the delta(t), which gives you the object current velocity)
2nd: Suika Game: 
  a: Spawn cats after dropping a cat and being able to change next cat x position
  b: merging
  
*/
import java.util.Random;

PImage wood ;
ArrayList<Cat> cats; 
Constraints constraints; 
Cat next_cat; 
Random rand;
//Ending of Game
int points; 
boolean result; 
//Introduction of the game 
boolean game_active; 
PFont f; 

void setup(){
  background(0);
  size(600, 800);
  
  frameRate(60); 
  wood = loadImage("assets/Wood.jpeg");
  rand = new Random();
  
  cats = new ArrayList<Cat>(); 
  next_cat = new Cat(400, 0, 30, "assets/0.png", 0);  
  constraints = new Constraints(this, cats); 
  
  points = 0; 
  result = true; 
  
  game_active = true;
  f = createFont("Arial", 24,true);
}

void draw(){
  background(0); 
  image(wood, 0, 0, 600,800); 
  if(game_active == true){
    stroke(0);
    line(-1,50,801,50);
    //constraints.update(1.0/frameRate);
    constraints.update(1/frameRate);
    
    for(Cat c: cats){
      c.draw();
    }
    next_cat.draw();
    next_cat.changeX();
  }else if(game_active == false && result == false){
    textFont(f, 58); 
    fill(255); 
    textAlign(CENTER);
    text("You Lose", 300, 150);
    text("Points: " + points, 300, 200);
  }
}

void mousePressed(){
  if (game_active == true){
    //drops the next cat 
    cats.add(next_cat); 
    int num = rand.nextInt(4); 
    String image = "assets/" + num + ".png"; 
    int radius = (30 + (5*num));
    next_cat = new Cat(400, 0, radius, image, num); 
  }else if (game_active == false && result == true){
    game_active = true; 
  }
}
