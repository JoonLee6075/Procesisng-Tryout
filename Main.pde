// Joon Lee

PVector pos; //pos vector variable
PVector speed;// speed vector variable
//necessary variables
Enemy[] enemy = new Enemy[24];
Interface ui = new Interface(30);
float radius;
float spd;
int timer;
int thistimer;
int comparetimer;
int damagetimer;
int state;
int counter;
int health;
boolean gameover;




void setup() {
// giving values to variables

  pos = new PVector();//inis position
  speed = new PVector();//inis speed variable
  size(740, 680);// size of the canvus
  pos.x = width/2;// position x and y value given
  pos. y = height/2;
  radius = 50;
  gameover = false;
  health = 3; // change health if the players need more life
  background(0);
  

  spd = 5;  //speed value given
  // speed of x and y given
  speed.x = 0;
  speed.y = 0;
  damagetimer = 0;
  // timer and thistimer will be used to determine invincible frames
  timer = 0;
  thistimer = 400;
  state = 1; //default game state
  counter = 0;
  // making enemies inside an erray
  for (int i = 0; i < 24; i++) {
    enemy[i] = new Enemy(24);
    delay(120);
  }
}

void draw() {
  

//when the player hasn't started the game yet....
  if ( state == 1) {
    
    background(0);
    fill(255, 255, 255);
    textSize(80);
    text("Dodge Until the End", 50, 200);

    textSize(50);
    text("press spacebar to start", 120, 400);
    if (key == ' ') {
      state = 0;
      // when spacebar is pressed change game state to 0 
    }
  }









// when game state is 0, start the game
  if (state == 0) {

    background(0); // back ground = black
    timer++;//how long thep player survived
    comparetimer++;
    ui.score();// necessary UIs including score and stage
    ui.display();
    checkDistance();// check if the player is hit or not
    ui.drawheart();// 3 healthbar for the player
    playerLock();


    if (gameover == true) {
      ui.endgame();
      state = 10;
      // if game over is true end the game.
    }




    if (counter > 0) {
// as the counter goes up start next round
      nextRound();
    }
    if (counter > 1) {
      nextRound();
    }

//creating player 
    fill(0, 255, 255);
    circle(pos.x, pos.y, radius);// create a circle in the middle
    pos.add(speed);
    enemy[0].display();
    enemy[0].ascend();
    enemy[1].display();
    enemy[1].ascend();
    if (thistimer == comparetimer) {
      comparetimer = 0;
      counter++;
    }
  }
}



// locks the player in the green boundary
void playerLock() {
  if (pos.x < 60) {
    pos.x = 60;
  }
  if (pos.x > 640) {
    pos.x = 640;
  }
  if (pos.y < 50) {
    pos.y = 50;
  }
  if (pos.y > 550) {
    pos.y = 550;
  }
}

// move the circle based on the key pressed.
// a key moves the circle right
// d key moves the circle left
// w key moves the circle up
// s key moves the circle down
//space stops the circle
void keyPressed() {
  if (key == 'a') {


    speed.x = -spd;
    speed.y = 0;
  }
  if (key == 'd') {
    speed.x = spd;
    speed.y = 0;
  }
  if (key == 'w') {
    speed.x = 0;
    speed.y = -spd;
  }
  if (key == 's') {
    speed.x = 0;
    speed.y = spd;
  }

  if (key == ' ') {
    speed =new  PVector(0, 0);
  }
}
// when each key is released set the player movement speed to 0

void keyReleased() {
  if (key == 'a' && keyPressed == false) {
    speed.x = 0;
    speed.y = 0;
  }
  if (key == 'd'  && keyPressed == false) {
    speed.x = 0;
    speed.y = 0;
  }
  if (key == 'w'  && keyPressed == false) {
    speed.x = 0;
    speed.y = 0;
  }
  if (key == 's' && keyPressed == false) {
    speed.x = 0;
    speed.y =0;
  }

  if (key == ' ') {
    speed =new  PVector(0, 0);
  }
}
// based on the round, play certain round
void  nextRound() {
  for (int i = 3; i < 5; i++) {
    enemy[i + counter].display();
    enemy[i + counter].ascend();
    if (counter == 2) {
      enemy[i + counter - 1].display();
      enemy[i + counter - 1].ascend();
    }
    if (counter == 3) {
      enemy[i + counter + 1].display();
      enemy[i + counter + 1].ascend();
      enemy[i + counter - 1].display();
      enemy[i + counter - 1].ascend();
      enemy[i + counter + 10].displayL();
      enemy[i + counter + 10].ascendL();
    }
    if (counter == 4) {
      enemy[i + counter + 1].display();
      enemy[i + counter + 1].ascend();
      enemy[i + counter - 1].display();
      enemy[i + counter - 1].ascend();
      enemy[i + counter + 2].display();
      enemy[i + counter + 2].ascend();
      enemy[i + counter - 2].display();
      enemy[i + counter - 2].ascend();
    }
    if (counter == 5) {
      enemy[i + counter + 1].display();
      enemy[i + counter + 1].ascend();
      enemy[i + counter - 1].display();
      enemy[i + counter - 1].ascend();
      enemy[i + counter + 2].display();
      enemy[i + counter + 2].ascend();
      enemy[i + counter - 2].display();
      enemy[i + counter - 2].ascend();
      enemy[i + counter + 4].displayL();
      enemy[i + counter + 4].ascendL();
    }
    if (counter == 6) {
      enemy[i + counter + 1].display();
      enemy[i + counter + 1].ascend();
      enemy[i + counter - 1].display();
      enemy[i + counter - 1].ascend();
      enemy[i + counter + 2].display();
      enemy[i + counter + 2].ascend();
      enemy[i + counter - 2].display();
      enemy[i + counter - 2].ascend();
      enemy[i + counter + 4].displayD();
      enemy[i + counter + 4].ascendD();
    }
    
    if ( counter == 7  ){
      //when player reach stage 7 , end the game
      if(state != 10){
      ui.wingame();
      }
    }
  }
}
// checks the distance between the enemy and the player. If the distance is less than the radius of the player they are hit.
// When hit, the player gets invincible for couple second. And have limited life of 3.
// the invinvible timer is default set to 2 second.
void checkDistance() {
  for (int i = 0; i< enemy.length; i++) {
    if (dist(enemy[i].x, enemy[i].y, pos.x, pos.y) < radius && health == 3) {
      health--;
      damagetimer = timer;
      print(health);
    }

    if (dist(enemy[i].x, enemy[i].y, pos.x, pos.y) < radius && health == 2 ) {

      if (damagetimer + 200 < timer) {

        health--;
        damagetimer = timer;
        print("hit");
      }
    }

    if (dist(enemy[i].x, enemy[i].y, pos.x, pos.y) < radius && health == 1 ) {
      if (damagetimer + 200 < timer) {

        health--;
      }
    }

// when health is 0 , move the enemies off screen and set game over to true.

    if (health == 0) {

      for (int z = 0; z < enemy.length; z++) {
        enemy[z].x = 1000;
        enemy[z].y = 1000;
        gameover = true;
      }
    }
  }
}
