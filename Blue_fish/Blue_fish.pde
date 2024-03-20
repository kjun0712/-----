size(200,100);

int px=200;
int py=100;
int unit=5;

fill(#0000FF);
stroke(#0000FF);
arc(px/2,py/2+unit,unit*4,unit*4,radians(210),radians(330),OPEN);
arc(px/2,py/2-unit,unit*4,unit*4,radians(30),radians(150),OPEN);

triangle(px/2+unit,py/2,px/2+unit*3,py/2-unit,px/2+unit*3,py/2+unit);
