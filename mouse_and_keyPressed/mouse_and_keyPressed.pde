void setup(){
  size(800,800);
  background(255);
}

void draw(){
  if(mousePressed==true){
    strokeWeight(10);
    point(mouseX,mouseY);
  }
  
  if(keyPressed==true){
    background(255);
  }
  /*
  background(0);
  if(mousePressed==true){
    fill(random(256),random(256),random(256));
    ellipse(mouseX,mouseY,50,50);
  }
  */
}
