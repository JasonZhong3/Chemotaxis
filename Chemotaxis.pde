int i = 0;
boolean gameState = true;
Meteors [] bob = new Meteors[100];
Human joe = new Human();
void setup()
{
  size(1000, 800, P3D);
  frameRate(50);
  for (i = 0; i < bob.length; i++) {
    bob[i] = new Meteors();
  }
}
void draw()
{
  //move and show the bacteria
  background(0);
  fill(0, 255, 0);
  rect(0, 700, 1000, 700);
  while (gameState == true) {
    for (i = 0; i < bob.length; i++) {
      bob[i].walk();
      bob[i].show();
      joe.gameOver();
    }
    joe.move();
    joe.show();
  }
}
class Meteors
{
  int myX, myY;
  Meteors() {
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*1000)-1000;
  }
  void walk() {
    myX = myX + (int)(Math.random()*10)-5;
    myY = myY + (int)(Math.random()*15);
  }
  void show() {
    fill(255, 0, 0);
    ellipse(myX, myY, 50, 50);
    ellipse(myX, myY, 50, 50);
    ellipse(myX, myY, 50, 50);
  }
}

class Human
{
  int x = 540;
  int y = 665;
  void move() {
    if (mouseX > x)
      x += (int)(Math.random()*15);
    else
      x -= (int)(Math.random()*15);
  }
  void show() {
    fill(255, 255, 255);
    stroke(255, 255, 255);
    ellipse(x, 665, 10, 10);
    line(x, 665, x, 685);
    line(x, 675, x+10, 680);
    line(x, 675, x-10, 680);
    line(x, 685, x-5, 700);
    line(x, 685, x+5, 700);
  }
  void gameOver() {
    if (dist(bob[i].myX, bob[i].myY, joe.x, joe.y) < 25) {
      gameState = false;
      background(255, 255, 255);
      text("GAME OVER!", 450, 375, 250);
    }
  }
}
