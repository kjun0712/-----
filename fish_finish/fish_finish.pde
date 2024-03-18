size(300,300);

float px=300;
float py=300;
int unit=10;

ellipse(px/2,py/2,unit*6,unit*6);  //몸

stroke(#0000FF);
arc(px/2+unit*3,py/2,unit*6,unit*6,radians(120),radians(240));  //아가미

strokeWeight(10);
stroke(0);
point(px/2+unit*2,py/2-unit);  //눈

strokeWeight(1);
triangle(px/2-unit*3,py/2,px/2-unit*5,py/2-unit,px/2-unit*5,py/2+unit);  //큰 지느러미
triangle(px/2,py/2-unit,px/2-unit,py/2-unit*3/2,px/2-unit,py/2-unit/2);  //작은 지느러미
