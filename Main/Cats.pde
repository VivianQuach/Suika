public class Cats{
  final int strX = 350;
  final int strY = 50;
  float xspeed = 2.2;  // Speed of the shape
  float yspeed = 2.5;  // Speed of the shape

  int xdirection = 1;  // Left or Right
  int ydirection = 1;  // Top to Bottom
  float posX; 
  float posY; 
  //the size is used for seeing how far it can do down based on the border or cat 
  int size; 
  PImage cat;
  final int endY = 800-61; 

  public Cats(int size, String cat){
    this.size = size; 
    this.cat = loadImage(cat);
    posX = strX; 
    posY = strY; 
    
  }
  public float getPosX(){
    return posX; 
  }
  public float getPosY(){
    return posY; 
  }
  public void changeYPos(){
    if((posY + (yspeed * ydirection)*1.5) < endY){
      posY = posY + (yspeed * ydirection)*1.5;
    }
  }
  public void  changeXPos(){
    posX = mouseX; 
  }
  
  public int end_x_pos(){
    return 0;
  }
  public int end_y_pos(){
    return 0; 
  }
  public int getSize(){
    return size; 
  }
  public PImage getImage(){
    return cat;
  }
  void display(){
     image(cat, posX,posY, size, size); 
  }
}
