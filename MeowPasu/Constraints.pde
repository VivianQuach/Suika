import processing.sound.*;
import java.util.Random;
class Constraints{
  //1st: apply gravity to an object 
  //2nd: add border constraints
  //3rd: add collision constraints 
  
  PVector gravity = new PVector(0, 500); 
  ArrayList<Cat> cats; 
  //Sound
  SoundFile nyanPasu;
  SoundFile meow; 
  SoundFile nyan; 
  PApplet p;

  public Constraints(PApplet p, ArrayList<Cat> cats){
    this.cats = cats; 
    applyConstraints();
    resolveCollision();
    //Intializing Sound Files
     nyanPasu = new SoundFile(p,"assets/nyanpasu.mp3");
     meow = new SoundFile(p, "assets/meow.mp3");
     nyan = new SoundFile(p, "assets/nyan.mp3");
  }
  
  void update(float dt){
    applyGravity();
    applyConstraints();
    resolveCollision();
    update_position(dt); 
    losingLine(); 
  }
  void update_position(float dt){
    for(Cat c: cats){
      c.update_pos(dt);
    }
  }
  void applyGravity(){
    for(Cat c: cats){
      c.accelerate(PVector.div(gravity, c.inverse_mass));
    }
  }
  //Makes sure the object stays in the window 
  void applyConstraints(){
    PVector topLeft = new PVector(0, -100);  // Top-left corner of the rectangle
    PVector bottomRight = new PVector(600, 800);  // Bottom-right corner of the rectangle
    
    for (Cat c : cats) {
        // Check if the cat's current position is outside the rectangle
        if (c.current_position.x < topLeft.x + c.radius) {
            c.current_position.x = topLeft.x + c.radius;
        }else if (c.current_position.x > bottomRight.x - c.radius) {
            c.current_position.x = bottomRight.x - c.radius;
        }
        if (c.current_position.y > bottomRight.y - c.radius) {
            c.current_position.y = bottomRight.y - c.radius;
        }
    }
  }
  void resolveCollision(){
    //a vector that is parallel to the two objects 
    PVector collision_axis; 
    //normal
    PVector n;
    float delta; 
    ArrayList<Cat> delete_cats = new ArrayList<Cat>(); 
    ArrayList<Cat> add_cats = new ArrayList<Cat>(); 
    for(Cat a: cats){
      for(Cat c: cats){
        //not checking the same object
        if(c == a) continue; 
        
        collision_axis = PVector.sub(a.current_position, c.current_position);
        //If two objects goes inside each other, it should separate 
        if(a.current_position.dist(c.current_position) < (a.radius + c.radius)){
          n = PVector.div(collision_axis, collision_axis.mag());
          //Area where they overlap
          delta = a.radius + c.radius - a.current_position.dist(c.current_position);
          //Checking if they the same object and are touchinng, if so merge
          if(a.level == c.level&& a.touch == false && c.touch == false){
            //See which object is at the bottom and just put the new cat there 
            if(a.current_position.y > c.current_position.y){
              add_cats.add(new Cat(a.current_position, a.level + 1));
            }else{
              add_cats.add(new Cat(c.current_position, a.level + 1));
            }
            c.touch = true; 
            a.touch = true; 
            delete_cats.add(c);
            delete_cats.add(a);
            points += 2*c.level + 2; 
          }else{
            //make them dont overlap no more (split the spliting into 2) 
            a.current_position.add(PVector.mult(n, 0.1*delta));
            c.current_position.sub(PVector.mult(n, 0.1*delta));
          }
        }
      }
    }
    for (Cat c: add_cats){
      cats.add(c); 
      int which_cat = rand.nextInt(2);
      if(cats.get(add_cats.size() -1).get_level() == 9){
         nyanPasu.play();
      }else if(which_cat == 0){
         meow.play();
      }else{
       nyan.play();
      }
    }
    for (Cat c: delete_cats){
      cats.remove(c);
    }
    delete_cats = new ArrayList<Cat>();
    add_cats = new ArrayList<Cat>();
  }
  
  void losingLine(){
    for(Cat c: cats){
      //If a cat is beyond the line, then the player loses 
      if (c.current_position.y - c.radius < 50   && c.time_count == 5 && c.current_position.y - c.previous_position.y <= 0 ) {
            print("Points: " + points);
            game_active = false; 
            result = false; 
      }
       else if(c.current_position.y - c.radius < 50  && c.time_count < 5 && c.current_position.y - c.previous_position.y <= 0  ){
         c.time_count++; 
       }
       else{
         c.time_count = 0; 
       }
    }
  }
  
}
