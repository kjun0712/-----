void setup(){
  size(1200,800);
  c1x=width/2;
}

float c1x, c1y=560;
float c2x, c2y=560;
int t=10;

void sky(){
  for(int i=0; i<56; i++){
    float sy=10*i;
    float sr=190+(220-190)/56.0*i;
    float sg=247+(110-247)/56.0*i;
    float sb=255+(1-255)/56.0*i;
    fill(sr,sg,sb);
    rect(0,sy,width,10);
  }
}

void road(){
  fill(52);
  rect(0,c1y,width,100);

  fill(255,151,30);
  for(int i=0; i<6; i++){
    rect(50+200*i,c1y+45,100,10);
  }
}  
void car1(){
  fill(20,140,200);
  rectMode(CENTER);
  rect(c1x,c1y,10*t,4*t);
  rectMode(CORNER);
  rect(c1x-t,c1y-4*t,6*t,2*t);
  fill(0);
  ellipse(c1x-2.5*t,c1y+2*t,3*t,3*t);
  ellipse(c1x+2.5*t,c1y+2*t,3*t,3*t);    //car
}

void car2(){
  fill(20,140,200);
  rectMode(CENTER);
  rect(c2x,c2y+5*t,10*t,4*t);
  rectMode(CORNER);
  rect(c2x-5*t,c2y+t,6*t,2*t);
  fill(0);
  ellipse(c2x-2.5*t,c2y+7*t,3*t,3*t);
  ellipse(c2x+2.5*t,c2y+7*t,3*t,3*t);    //car
}
void draw(){
  c1x=c1x-2;
  c2x=c2x+2;
  background(99, 56, 5);
  
  noStroke();
  
  sky();
  road();
  
  fill(20,173,3);
  for (int x=50; x<width; x+=100){
    triangle(x, c1y-30, x+15, c1y, x-15, c1y);
  }    // tree

  car1();
  car2();
  fill(20, 173, 3);
  for (int x=50; x<width; x+=100){
    triangle(x, c1y+100-30, x+15, c1y+100, x-15, c1y+100);
  }    //tree
}
