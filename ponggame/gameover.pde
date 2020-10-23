void gameover() {
  
  //win screen
  if (leftscore == 3) {
   fill(0, 255, 0);
   textAlign(CENTER, CENTER);
   textSize(70);
   text("PLAYER 1 WINS", 400, 300);
  }
  if (rightscore == 3) {
   fill(0, 255, 0);
   textAlign(CENTER, CENTER);
   textSize(70);
   text("PLAYER 2 WINS", 400, 300);
  }
}
  

void gameoverClicks() {
   mode = INTRO;
   reset();
}
