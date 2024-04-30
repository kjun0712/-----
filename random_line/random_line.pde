void setup(){
  size(600,400);
  background(0);
}

float x1 = random(width);
float y1 = random(height);

void draw(){
  stroke(255);
  float x2 = random(width);
  float y2 = random(height);
  
  line(x1,y1,x2,y2);
  
  x1=x2;
  y1=y2;
}
