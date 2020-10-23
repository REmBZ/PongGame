void tactile(int x, int y, int w, int h) { //Multi-player
  if (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h) {
   fill(200); 
  } else {
    fill(255);
  }   
}

void tactile2(int x2, int y2, int w2, int h2) { //Single player
  if (mouseX > x2 && mouseX < x2+w2 && mouseY > y2 && mouseY < y2+h2) {
   fill(200); 
  } else {
    fill(255);
  }   
}

void tactile(int x, int y, int r) {
 if (dist(x, y, mouseX, mouseY) < 40) {
   fill(gray);
 } else {
   fill(255);
 }
}

void reset() {
  leftscore = rightscore = 0;
   leftx = 0;
  lefty = height/2;
  leftd = 200;
  
  rightx = width;
  righty = height/2;
  rightd = 200;
  
   ballx = width/2;
  bally = height/2;
  balld = 50;
  a = random(radians(0), radians(360));
  vx = 6*cos(a);
  vy = 6*sin(a);
  k = sqrt((ballx - leftx)*(ballx - leftx) + (bally - lefty)*(bally - lefty))/16;
  k = sqrt((ballx - rightx)*(ballx - rightx) + (bally - righty)*(bally - righty))/16;
  
}
