void setup(){
  size(500,500);
}
int a=0;
int l=0;

void draw(){
  background(255);
  translate(width/2,height/2);
  
  pushMatrix();
  rotate(radians(a+=2));
  for(int i=0; i<6; i++){
     noStroke();
     fill(#FF0000);
     ellipse(0,0,70,6);
     rotate(radians(30));
  }
  popMatrix();
  
  pushMatrix();
  rotate(radians(l--));
  for(int t=0; t<12; t++){
    noStroke();
    fill(#FFFF00);
    ellipse(-70,-70,100,10);
    rotate(radians(30));
  }
  popMatrix();
  
  for(int x=-width/2; x<width; x+=30){
    for(int y=-height/2; y<height; y+=30){
      fill(#A7F1FF);
     ellipse(x,y,10,10);
    }
  }
}
