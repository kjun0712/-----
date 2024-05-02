float x; 
float y; 
float speed = 5; 
void setup() {
  size(240, 120); 
  background(230, 230, 0); 
  stroke(255);
  smooth();
  x=width/2; 
  y=height/2; 
  randomSeed(0); 
} 

void draw() {
  x = x + random(-speed, speed); 
  y = y + random(-speed, speed); 
  x = constrain(x, 0, width); 
  y = constrain(y, 0, height); 
  fill(0, 100, 200); 
  ellipse(x, y, 20, 20); 
} 
