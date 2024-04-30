void setup(){
  size(800,800);
  x1=50; y1=height/2; dx1=1; dy1=1;
  x2=width-50; y2=height/2; dx2=-1; dy2=-1;
}

float x1, y1, dx1, dy1;
float x2, y2, dx2, dy2;

void draw(){
  background(0);
  x1+=2*dx1; y1+=4*dy1;
  x2+=4*dx2; y2+=2*dy2;
  
  ellipse(x1,y1,100,100);
  ellipse(x2,y2,100,100);
  
  if(x1-50<0 || x1+50>width){
    dx1*=-1;
  }
  if(y1-50<0 || y1+50>height){
    dy1*=-1;
  }
  
  if(x2-50<0 || x2+50>width){
    dx2*=-1;
  }
  if(y2-50<0 || y2+50>height){
    dy2*=-1;
  }
  
  float d = dist(x1,y1,x2,y2);
  if(d<100){
    dx1*=-1; dy1*=-1; 
    dx2*=-1; dy2*=-1; 
  }
}
