PVector pos; //pos vector variable
PVector speed;// speed vector variable
Enemy[] enemy = new Enemy[2];


float spd;
int timer;
int thistimer;
int state;
void setup(){
  pos = new PVector();//inis position
  speed = new PVector();//inis speed variable
  size(640,480);// size of the canvus
pos.x = width/2;// position x and y value given
 pos. y = height/2;
  
  spd = 5;  //speed value given
  // speed of x and y given
 speed.x = 0;
 speed.y = 0;
 timer = 0;
 thistimer = 0;
 state = 0;
 for(int i = 0; i < 2; i++){
   enemy[i] = new Enemy(24);
 
  
}
}

void draw(){
  background(0); // back ground = black
  timer++;
  textSize(50);
  fill(255,0,0);
  text(int(timer / 100),60, 60);
 


if(state == 0){
   fill(0,255,255);
  circle(pos.x, pos.y, 50);// create a circle in the middle
pos.add(speed);
enemy[0].display();
enemy[0].ascend();
enemy[1].display();
enemy[1].ascend();
if(timer == 300){
  state = 1;
}
  
  
}

}
// move the circle based on the key pressed.
// a key moves the circle right
// d key moves the circle left
// w key moves the circle up
// s key moves the circle down
//space stops the circle
void keyPressed(){
  if(key == 'a'){
 
    
    speed.x = -spd;
    speed.y = 0;
 
  
  
  }
  if(key == 'd'){
    speed.x = spd;
    speed.y = 0;
  }
  if(key == 'w'){
   speed.x = 0;
    speed.y = -spd;
  }
  if(key == 's'){
    speed.x = 0;
    speed.y = spd;
  }
  
  if(key == ' '){
    speed =new  PVector(0,0);
  }
}

void keyReleased(){
    if(key == 'a' && keyPressed == false){
    speed.x = 0;
    speed.y = 0;
  
  }
  if(key == 'd'  && keyPressed == false){
    speed.x = 0;
    speed.y = 0;
  }
  if(key == 'w'  && keyPressed == false){
   speed.x = 0;
    speed.y = 0;
  }
  if(key == 's' && keyPressed == false){
    speed.x = 0;
    speed.y =0;
  }
  
  if(key == ' '){
    speed =new  PVector(0,0);
  }
}
