
import java.util.Random; 
//Background Image
PImage wood;

ArrayList<Cats> c = new ArrayList<Cats>(); 
//Iterating through the arraylist to get more cats in the game 
int count = 0; 
int num = 3;
boolean clicked = false;

final int endY = 800-61;

void setup() {
  size(800, 800);
  frameRate(30);
  //Box of the game
  wood = loadImage("Wood_Background.jpeg");
}

void draw() {
  background(255);
  image(wood, 100, 150, 600, 650);

  if(num == 3){
    System.out.println("in");
    num = drop_Cat();
    addCat();
  }
   
  image(c.get(count).getImage(), c.get(count).getPosX(), c.get(count).getPosY(), c.get(count).getSize(), c.get(count).getSize()); 
  if (clicked == true && ((int)(c.get(count).getPosY())) < endY ) {
     c.get(count).changeYPos();
  }
  else{
    mouseReleased();
  }
  //println(((int)(c.get(count).getPosY())) );
  for(Cats cat: c){
    cat.display(); 
  }
    //Dead line
  /*noStroke();
   line(100,150, 700, 150);*/
}

void mousePressed() {
  if (c.get(count).getPosY() < endY && num != 3 && clicked == false ) {
    System.out.println("Pressed");
    clicked = true;
    c.get(count).changeXPos(); 
  }
}
void mouseReleased(){
  if (((int)(c.get(count).getPosY())) >= endY) {
    System.out.println("unclicked");
    clicked = false; 
    num = 3;
    ++count; 
    println(c.get(count-1).getSize()); 
    //after its drop, anothe will appear 
  }
}
//Randomly picking a cat to drop 
int drop_Cat(){
  Random rand = new Random(); 
  int rand_num = rand.nextInt(3);
  //System.out.println("Rand"); 
  return rand_num; 
}
//Adding a certain cat 
void addCat(){
  if(num == 0) {
    c.add(new Cats(75,"Level1.png"));
  }else if (num == 1){
    c.add(new Cats(80,"Level2.png"));
  }else if (num == 2){
    c.add(new Cats(85,"Level3.png"));
  }
}
