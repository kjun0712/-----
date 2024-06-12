void setup(){
  size(2000,1000);
  y=0;
  r=0;
}

float y,r;

void draw(){
  background(0,0,0,150);
  translate(width/2,height/2);
  r+=0.1;
  rotate(r);
  /*
  stroke(random(256),random(256),random(256));
  line(0,0,random(50),random(50));
  */
  noStroke();
  ellipse(0,0,100,100);
  fill(0);
  ellipse(0,0,80,80);
}
