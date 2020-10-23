void intro() {
background(red);

franchise = createFont("Franchise.ttf", 200);
textSize(200);
textFont(franchise);
text("PONG", 400, 250);

tactile2(350, 375, 100, 75);
rect(400, 425, 100, 50);
fill(0);
strokeWeight(3);
textAlign(CENTER, CENTER);
textSize(20);
text("Single player", 400, 425);

tactile(350, 460, 100, 75);
rect(400, 500, 100, 50);
fill(0);
textAlign(CENTER, CENTER);
textSize(20);
text("Multi player", 400, 500); 
}


void introClicks() {
  if (mouseX > 350 && mouseX < 450 && mouseY > 375 && mouseY < 450) { //Single
    mode = GAME;
    AI = true;
  }
  if (mouseX > 350 && mouseX < 450 && mouseY > 460 && mouseY < 525) { //Multi
    mode = GAME;
    AI = false;
  }
}
