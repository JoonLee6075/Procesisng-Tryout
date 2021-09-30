 public class Enemy{

   float x;
   float y;
   float diameter;
   float ySpeed = 4;
   float xSpeed = 4;
   
 
  
  Enemy(float tempD){
    x = random(width);
    y = height;
    diameter = tempD;
    ySpeed = random(0.5,2.5);
    
    
    
  }
  
  void display(){
    stroke(0);
    fill(255,0,0);
    ellipse(x,y,64,63);
  }
  void ascend(){
    x = x + xSpeed;
    y = y + ySpeed;
    if(x > width){ 
    xSpeed = xSpeed * -1;  //send the ball the other way when it hits the border.
   
  }
  
  if(x < 0){ 
    xSpeed = xSpeed * -1; 
    
  }
  if(y > height) {
    ySpeed = ySpeed * -1;
   
  }
  if(y < 0) {
    ySpeed = ySpeed * -1;
   
  }
    
 } 
 }
