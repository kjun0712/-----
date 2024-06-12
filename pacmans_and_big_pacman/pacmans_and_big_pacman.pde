float [] x = new float [3000];
float [] speed = new float [3000];

float rpx, rpy;
float rpcx, rpcy;
float rpa=0;
float rps;

void setup(){
  size(480, 240);
  noStroke();
  for(int i=0; i<x.length; i++){
    x[i] = random(-2000, 200);
    speed[i] = random(0.5, 1.5);
  }
  
  rpx = width-10;
  rpy = height/2;
  rpcx = random(0, width);
  rpcy = random(0, height);
  rps = random(height/4, height/2);
}
  
void draw(){
  background(0);
  fill(255, 200);
  for(int i=0; i<x.length; i++){
    x[i] += speed[i];
    float yi = float(height)/x.length*i;
    arc(x[i], yi, 12, 12, radians(30), radians(330));
  }
  
  rpa += 0.1;
  
  if(rpa >= TWO_PI){
    rpcx = random(0, width);
    rpcy = random(0, height);
    rps = random(height/4, height/2);
    rpa = 0;
  }
    
  rpx = rpcx + cos(rpa)*rps;
  rpx = constrain(rpx, 0+10, width-10);
  rpy = rpcy + sin(rpa)*rps;
  rpy = constrain(rpy, 0+10, height-10);
    
  fill(255,0,0);
  arc(rpx, rpy, 20, 20, radians(180+30), radians(360+180-30));
  
}
