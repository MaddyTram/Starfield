Particle[] p = new Particle[700];
void setup() {
  size(400, 400);
  noStroke();
  p[699] = new Meteor();
  for (int i = 0; i < p.length - 1; i++) {
    p[i] = new Particle();
  }
}
void draw() {
  background(0);
  for (int i = 0; i < p.length; i++) {
    p[i].show();
    p[i].move();
  }
}

class Particle {
  double myX, myY, mySpeed, myAngle;
  int myColor, mySize;
  Particle() {
    myX = 200;
    myY = 200;
    myColor = (#FFFEED);
    mySpeed = (Math.random()*5);
    myAngle = Math.random()*(2*Math.PI);
    mySize = (int)(Math.random()*5) + 5;
  }
  void show() {
    fill(myColor);
    ellipse((float)myX, (float)myY, mySize, mySize);
  }
  void move() {
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
    if ((myX < 0) || (myX > 400)) {
      myX = (Math.random()*15) + 200;
      myY = (Math.random()*5) + 200;
      mySpeed = Math.random()*3;
    }
    if ((myY < 0) || (myY > 400)) {
      myX = (Math.random()*15) + 200;
      myY = (Math.random()*5) + 200;
      mySpeed = Math.random()*3;
    }
  }
} //end of Particle class

class Meteor extends Particle {
  Meteor() {
    myX = (Math.random()*200) + 100;
    myY = 0;
    myColor = (#6A2D1C);
    mySpeed = 2;
    myAngle = Math.random()*(2*Math.PI);
    mySize = 20;
  }
  void move() {
    myX += Math.cos(myAngle) * mySpeed;
    myY += Math.sin(myAngle) * mySpeed;
    if ((myX < 0) || (myX > 400) || (myY > 400)) {
      myX = (Math.random()*200) + 100;
      myY = 50;
      myAngle = Math.random()*(2*Math.PI);
      mySpeed = (Math.random()*5) + 1;
    }
  }
}

