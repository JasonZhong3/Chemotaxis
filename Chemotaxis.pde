int i = 0;
int health = 50;
Meteors [] bob = new Meteors[50];
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
  //background
  background(0);
  fill(0, 255, 0);
  rect(0, 700, 1000, 700);
  //health
  fill(0, 0, 0);
  text("Health: " + health, 300, 700, 100);
  //stars
  //fill(255,255,0);
  //for(int i = 0; i < 25; i++)
  //ellipse((int)(Math.random()*1000), (int)(Math.random()*800), 5, 5);

  //falling meteors!!
  for (i = 0; i < bob.length; i++) {
    bob[i].walk();
    bob[i].show();
    if (dist(bob[i].myX, bob[i].myY, joe.x, joe.y) < 25) {
      background(255, 0, 0);
      health--;
    }
  }
  //human controls
  joe.move();
  joe.show();
  joe.gameOver();
}
class Meteors
{
  int myX, myY;
  Meteors() {
    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*2000)-2000;
  }
  void walk() {
    myX = myX + (int)(Math.random()*21)-10;
    myY = myY + (int)(Math.random()*15);
    if (bob[i].myY > 800)
      myY = -100;
  }
  void show() {
    fill(255, 0, 0);
    ellipse(myX, myY, 50, 50);
    ellipse(myX+3, myY-5, 15, 15);
    ellipse(myX-8, myY+16, 10, 10);
    ellipse(myX+8, myY+16, 10, 10);
  }
}

class Human
{
  int x = 540;
  int y = 665;
  void move() {
    if (mouseX >= x)
      x += (int)(Math.random()*20);
    else
      x -= (int)(Math.random()*20);
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
    if (health <= 0) {
      background(0);
      fill(255, 0, 0);
      text("GAME OVER!", 475, 400, 500);
    }
  }
}
