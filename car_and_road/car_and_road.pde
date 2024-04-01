size(1200,800);
background(99, 56, 5);

float cx=width/2, cy=560;
int t=10;
noStroke();

for(int i=0; i<56; i++){
  float sy=10*i;
  float sr=190+(220-190)/56.0*i;
  float sg=247+(110-247)/56.0*i;
  float sb=255+(1-255)/56.0*i;
  fill(sr,sg,sb);
  rect(0,sy,width,10);
}    //sky

fill(52);
rect(0,cy,width,100);

fill(255,151,30);
for(int i=0; i<6; i++){
  rect(50+200*i,cy+45,100,10);
}    //road

fill(20,173,3);
for (int x=50; x<width; x+=100){
  triangle(x, cy-30, x+15, cy, x-15, cy);
}    // trees

fill(20,140,200);
rectMode(CENTER);
rect(cx,cy,10*t,4*t);
rectMode(CORNER);
rect(cx-t,cy-4*t,6*t,2*t);
fill(0);
ellipse(cx-2.5*t,cy+2*t,3*t,3*t);
ellipse(cx+2.5*t,cy+2*t,3*t,3*t);    //car

fill(20, 173, 3);
for (int x=50; x<width; x+=100){
triangle(x, cy+100-30, x+15, cy+100, x-15, cy+100);
}    //tree
