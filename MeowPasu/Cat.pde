class Cat{
  PVector current_position; 
  PVector previous_position; 
  PVector acceleration; 
  float radius; 
  float inverse_mass; 
  PImage cat_image; 
  int level; 
  boolean touch; 
  int time_count; 
  
  void draw(){
    image(cat_image, current_position.x - radius, current_position.y - radius, radius*2, radius*2);
  }
  /*
  update_pos: updates the object position from when it last traveled
  dt = difference in time 
  */
  void update_pos(float dt){
    //Gives us the velocity of the object 
    PVector velocity = PVector.sub(current_position, previous_position); 
    //Adds friction into the velocity (smaller the number the more friction there is) 
    velocity = PVector.mult(velocity, 0.94);  
    //Saving the current position of the object as its old position 
    previous_position = new PVector(current_position.x, current_position.y);
    //Verlet Equation is used to compute its new position 
    current_position.add(velocity);
    current_position.add(PVector.mult(acceleration, dt*dt*this.inverse_mass)); 
    //Reset acceleration
    acceleration = new PVector(0f, 0f); 
  }
  //Changes the acceleration 
 void accelerate(PVector acc){
   acceleration.add(acc); 
 }
 
 public Cat(float x, float y, float radius, String image, int level){
   current_position = new PVector(x,y); 
   previous_position = new PVector(x,y); 
   acceleration = new PVector(0,0); 
   this.radius = radius; 
   this.cat_image = loadImage(image); 
   this.inverse_mass = 1.0f/(PI*this.radius*this.radius*10); 
   this.level = level; 
   touch = false; 
   time_count = 0; 
 }
 public Cat(PVector position, int level){
   //since the objects get bigger, we don't want the object to bounce so we make the y position higher (this is based off how big the radius gets per level) 
   current_position = new PVector(position.x,position.y-5); 
   previous_position = new PVector(position.x,position.y-5);  
   acceleration = new PVector(0,0); 
   
   if(level >= 10){
     this.level = 0; 
     this.radius = 30;
     this.cat_image = loadImage("assets/0.png"); 
   }else{
     this.level = level; 
     this.radius = 30 + (level* 5) ; 
     this.cat_image = loadImage("assets/" + level + ".png"); 
   }
   this.inverse_mass = 1.0f/(PI*this.radius*this.radius*10); 
   touch = false;
   time_count = 0; 
 }
 
 void changeX(){ //<>//
   previous_position.x = current_position.x; 
   if (mouseX > 800 - radius) {  //<>//
      current_position.x = 800 - radius;
    } else if (mouseX < radius) { //<>//
     current_position.x = radius; 
    }else{ //<>//
      current_position.x = mouseX; 
    }
 }
 int get_level(){
   return level;
 }

}
