import processing.sound.*;
SoundFile file;
private Rectangle rect1;
private Rectangle rect2;
private long Kollisionen;
private int digits = 8;
private int timeSteps = 1000000;


void setup(){

  size(1600,800);
  double m2 = Math.pow(100,digits - 1);
  double v2 = (-5.0/timeSteps);
  rect1 = new Rectangle(400,700,100,1,0);
  rect2 = new Rectangle(800,600,200,m2,v2);
  System.out.println(v2);
  file = new SoundFile(this,"pi.wav");
}
void draw(){

  background(0);
  textSize(20);
  text("Kollisionen: " + Kollisionen,200,200);
  noFill();
  rect(0,0,1600,800);
  
  boolean clackSound = false;
  for(int i = 0; i < timeSteps; i ++){
  if(rect1.intersects(rect2)){
    double v1 = rect1.bounce(rect2);
    double v2 = rect2.bounce(rect1);
    rect1.v = v1;
    rect2.v = v2;
    Kollisionen += 1;
    clackSound = true;
  }
  if(rect1.bounceWithWall()){
    rect1.v = - rect1.v;
    Kollisionen += 1;
    clackSound = true;
  }
  rect1.update();
  rect2.update();
  }
  if(clackSound){
   file.play(); 
  }
  rect1.draw();
  rect2.draw();  
  
}

  
