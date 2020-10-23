void game() {
  background(red);
  
  
  //center line
  strokeWeight(1);
  stroke(0);
  fill(0);
  circle(400, 300, 200);
  fill(0);
  stroke(0);
  rect(400, 300, 20, 600);
  fill(red);
  circle(400, 300, 150);
  
  //scoreboard
  textSize(50);
  fill(255);
  text(leftscore, width/4, 100);
  fill(255);
  text(rightscore, 3*width/4, 100);
  //text(timer, 3*width/4, 550);
  timer = timer -1;
  
    //scoring
  if (ballx < 0) {
    score.rewind();
    score.play();
    rightscore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
  }
  if (ballx > 800) {
    score.rewind();
    score.play();
    leftscore++;
    ballx = width/2;
    bally = height/2;
    timer = 100;
  }
  
  //paddles
  strokeWeight(3);
  fill(255);
  stroke(0);
  circle(leftx, lefty, leftd);
  fill(0, 0, 255);
  text("P1", leftx + 50, lefty);
  
  fill(255);
  stroke(0);
  circle(rightx, righty, rightd);
  fill(255, 0, 0);
  text("P2", rightx - 50, righty);
  
  
  //move paddles
  if (wkey == true) lefty = lefty - 5;
  if (skey == true) lefty = lefty + 5;
  
  if (AI == false) {
    if (upkey == true) righty = righty - 5;
    if (downkey == true) righty = righty + 5;
  } else {
    if (ballx >= 400 && ballx < 800) {
      if (bally < 300) {
        righty = righty - 3;
      } else if (bally > 300) {
        righty = righty + 3;
      }
    }
  }
  
  
  //ball
  fill(255);
  stroke(0);
  circle(ballx, bally, balld);
  
  //pause button
  computerfont = createFont("Computerfont.ttf", 30);
  textFont(computerfont);
  tactile(75, 75, 80);
  strokeWeight(3);
  stroke(0);
  circle(75, 75, 80);
  fill(0);
  textSize(30);
  text("||", 75, 70);
  
  
  //moving ball
  if (timer < 0) {
  ballx = ballx + vx;
  bally = bally + vy;
  }
  
  
  
  //limit bounce
  if (lefty < 185) {
    lefty = 185;
  }
  if (lefty > 415) {
    lefty = 415;
  }
  
  if (righty < 185) {
    righty = 185;
  }
  if (righty > 415) {
    righty = 415;
  }
  
  //bounce
  if (dist(ballx, bally, leftx, lefty) <= ballr + leftr) {
    leftpaddle.rewind();
    leftpaddle.play();
    vx = (ballx - leftx)/k;
    vy = (bally - lefty)/k;
  }
  if (dist(ballx, bally, rightx, righty) <= ballr + rightr) {
    rightpaddle.rewind();
    rightpaddle.play();
   vx = (ballx - rightx)/k;
   vy = (bally - righty)/k;
  }

  if (bally < 25 || bally > height-25) {
    wall.rewind();
    wall.play();
   vy = vy * -1; 
  }
 
  if (leftscore == 3) {
     mode = GAMEOVER;
  }
  if (rightscore == 3) {
    mode = GAMEOVER;
  }
}

void gameClicks() {
  if (dist(mouseX, mouseY, 100, 100) < 37.5) { 
    mode = PAUSE;
  }
}
