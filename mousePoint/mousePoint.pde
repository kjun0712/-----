void setup(){
  size(800,800);
}

void draw(){
  background(255);
  line(mouseX,mouseY,mouseX,mouseY+25);
  line(mouseX,mouseY,mouseX+20,mouseY+20);
  line(mouseX+20,mouseY+20,mouseX+12,mouseY+20);
  line(mouseX+12,mouseY+20,mouseX+16,mouseY+28);
  line(mouseX+16,mouseY+28,mouseX+11,mouseY+30);
  line(mouseX+11,mouseY+30,mouseX+7,mouseY+22);
  line(mouseX+7,mouseY+22,mouseX,mouseY+25);
  if(mousePressed==true){
    //strokeWeight(10);
    point(mouseX,mouseY);
  }
}
