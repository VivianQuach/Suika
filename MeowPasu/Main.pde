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


void setup(){
  background(0);
  size(800, 800);
  frameRate(60); 
  wood = loadImage("Wood.jpeg");
  cats = new ArrayList<Cat>(); 
  next_cat = new Cat(400, 0, 30, "0.png", 0);  
  constraints = new Constraints(cats); 
  
}

void draw(){
  image(wood, 0, 0, 800,800); 
  stroke(0);
  line(-1,50,801,50);
  //constraints.update(1.0/frameRate);
  constraints.update(1/frameRate);
  for(Cat c: cats){
    c.draw();
  }
  next_cat.draw();
  next_cat.changeX();
}

void mousePressed(){
  //drops the next cat 
  cats.add(next_cat); 
  Random rand = new Random(); 
  int num = rand.nextInt(4); 
  String image = num + ".png"; 
  next_cat = new Cat(400,0, (30 + (5*num)), image, num);  
}
