void setup(){
  size(500,500);
  sx=250; sy=250; sr=100;
}

float sx,sy,sr;

void draw(){
  snowFlake(sx,sy,sr);
}

void snowFlake(float x,float y, float r){
  translate(x,y);
  ellipse(0,0,r,r);
  for(int i=0; i<7; i++){
    line(-r,-r/2-10,-r,r/2+10);
    rotate(radians(60));
  }
  for(int i=0; i<7; i++){
    ellipse(0,r+50,30,60);
    ellipse(0,r+95,15,30);
    rotate(radians(60));
  }
}
