size(600, 400); 
background(100, 10, 10); 
smooth(); 
randomSeed(1L); 

float x1 = random(width); 
float y1 = random(height); 

for(int i=0; i<70; i++) { 
  float x2 = random(width); 
  float y2 = random(height); 
  
  stroke(255, 150); 
  strokeWeight(4); 
  line(x1, y1, x2, y2); 
  x1=x2; 
  y1=y2; 
}
