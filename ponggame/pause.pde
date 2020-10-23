void pause() {

  tactile(75, 75, 80);
   strokeWeight(3);
   stroke(0);
  circle(75, 75, 80);
   fill(0);
  textSize(40);
   text(">", 75, 70);
   fill(0);
  textSize(50);
   text("Pause", 400, 300);
   
}

void pauseClicks() {
  if (dist(mouseX, mouseY, 100, 100) < 37.5) {
    mode = GAME;
  }
}
