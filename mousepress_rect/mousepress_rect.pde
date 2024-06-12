void setup(){
size(400,400);
r=random(256); 
g=random(256); 
b=random(256);
}
float r,g,b;
int k,t;

void draw(){
  if(mousePressed==true){
    translate(width/2, height/2);
    for(int i=0; i<=20; i++){
      rotate(0.3);
      fill(r,g,b);
      rect(50+k,50+k,40+t,40+t);
    }
    k+=5;
    t+=5;
  }
}
