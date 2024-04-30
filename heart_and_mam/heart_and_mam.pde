size(600,300);
float x=width*2/3,y=height*2/3;
background(#F3F71E);

fill(#F73B1E);
noStroke();
arc(x-15,y,30,30,PI,TWO_PI);
arc(x+15,y,30,30,PI,TWO_PI);
triangle(x-30,y,x+30,y,x,y+30);
//ellipse();
