size(300,300);  

ellipse(150,150,60,60);  //몸통

noFill();
stroke(#0000FF);
arc(180,150,60,60,radians(120),radians(240));   //아가미

strokeWeight(10);
stroke(0);
point(170,140);   //눈

strokeWeight(1);
triangle(120,150,100,140,100,160);  
triangle(150,140,140,135,140,145);   //지느러미
