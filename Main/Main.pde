
import java.util.Random; 
//Background Image
PImage wood;
//Dropped cats 
ArrayList<Cats> c = new ArrayList<Cats>(); 
//Pop up the next cat that will drop down
Cats nextCat;

void setup() {
  size(800, 800);
  frameRate(30);
  //Box of the game
  wood = loadImage("Wood_Background.jpeg");
  //First cat that will appear 
  nextCat = new Cats(75,"Level1.png");
}

void draw() {
  background(255);
  image(wood, 0, 0, 800, 800);
  //Allows cats to stay appeared while/after dropping 
  for(Cats cat: c){
    cat.changeYPos();
    cat.display(); 
  }
  //will show the next cat to drop, have the ability to change its X axis before dropping 
  nextCat.display();
  nextCat.changeXPos();
}
//When clicked, drop the cat 
void mousePressed() {
  drop_Cat();
}

//Randomly picking a cat to drop
void drop_Cat(){
  //Dropping the cat shown
  c.add(nextCat);
  //Producing the next cat 
  Random rand = new Random(); 
  int num = rand.nextInt(3);
  if(num == 0) {
    nextCat = new Cats(75,"Level1.png");
  }else if (num == 1){
    nextCat = new Cats(80,"Level2.png");
  }else if (num == 2){
    nextCat = new Cats(85,"Level3.png");
  }
}
