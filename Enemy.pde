 public class Enemy{

   float x;
   float y;
   float diameter;
   float ySpeed = 2;
   float xSpeed = 2;
   
 
  
  Enemy(float tempD){
    x = random(width);
    y = height;
    diameter = tempD;
    ySpeed = random(1,2.5);
    
    
    
  }
  
  void display(){
    stroke(0);
    fill(0,0,255);
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
 
 void displayL(){
    stroke(0);
    fill(0,255,0);
    ellipse(x,y,150,150);
   
   
 }
 void ascendL(){
   y = y - ySpeed;
 }
  void displayD(){
    stroke(0);
    fill(255,0,255);
    ellipse(x,y - 680,50,50);
    ellipse(x - 150  , y - 680 , 50, 50);
    ellipse(x + 150,y-680,50,50);
    ellipse(x - 300,y-680,50,50);
   
   
 }
 void ascendD(){
    x = x + xSpeed + 3;
    y = y + ySpeed + 3;
 }
 }
