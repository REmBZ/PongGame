import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


//Pong
//Andy Ren
//1-1
//10/15/2020

//font
PFont franchise;
PFont computerfont;

//color schemes
color gray = #6F847F;
color red = #E04735;

int mode;
final int INTRO  = 1;
final int GAME  = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

//ball variables
float vx, vy; //velocity
float a, k; //angle

//game variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddles
float ballx, bally, balld; //ball
float ballr, leftr, rightr;
boolean AI;

//score variables
int leftscore, rightscore, timer;

//sound variables
Minim minim;
AudioPlayer leftpaddle, rightpaddle, wall, score;

//keyboard variables
boolean wkey, skey, upkey, downkey;

void setup() {
  size(800, 600); 
  mode = INTRO;
  //mode = GAME;
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  
   //minim
  minim = new Minim(this);
  leftpaddle = minim.loadFile("leftpaddle.wav");
  rightpaddle = minim.loadFile("rightpaddle.wav");
  wall = minim.loadFile("wall.wav");
  score = minim.loadFile("score.wav");
 
   
  
  //initalize paddles
  leftx = 0;
  lefty = height/2;
  leftd = 200;
  
  rightx = width;
  righty = height/2;
  rightd = 200;
  
  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 50;
  a = random(radians(0), radians(360));
  vx = 6*cos(a);
  vy = 6*sin(a);
  k = sqrt((ballx - leftx)*(ballx - leftx) + (bally - lefty)*(bally - lefty))/16;
  k = sqrt((ballx - rightx)*(ballx - rightx) + (bally - righty)*(bally - righty))/16;
  
  
   ballr = balld/2;
   leftr = leftd/2;
   rightr = rightd/2;
   
   //initialize score
   rightscore = leftscore = 0;
   timer = 100;
  
  //initialize keyboard vars
  wkey = skey = upkey = downkey = false;

}


void draw() {
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  }else if (mode == GAMEOVER) {
    gameover();
  } else {
    println("Mode error: " + mode);
  }
}
