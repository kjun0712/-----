size(800,800);
int px=width/2;
int py=height/2;
background(#81E3FF);    //하늘색 설정
fill(#24AA00);    //땅,잔디 색설정
rect(0,py,width,py);    //땅범위설정

for(int i=0; i<width; i+=height/120*5){
    for(int t=py; t<height; t+=height/120*5){
      triangle(i,t,i+height/120*5,t,i+height/120,t-height/120*3);
      triangle(i+height/120,t,i+height/120*2,t,i+height/120,t-height/120*3);
      triangle(i+height/120,t,i+height/120*3,t,i+height/120*2,t -height/120*4);
  }
}    //잔디그리기

//다리 그려야함
fill(255);
stroke(255);
ellipse(px, py, height/80*8,height/80*8);    //매인몸통
ellipse(px-height/80*6, py, height/80*4,height/80*6);
ellipse(px-height/80*4, py+height/80*3, height/80*5,height/80*6);
ellipse(px-height/80, py+height/80*4, height/80*4,height/80*4);
ellipse(px+height/80, py+height/80*4, height/80*4,height/80*4);
ellipse(px+height/80*3, py+height/80*3, height/80*4,height/80*4);
ellipse(px+height/80*4, py+height/80, height/80*4,height/80*4);
ellipse(px+height/80*3, py-height/80, height/80*4,height/80*4);
ellipse(px+height/80, py-height/80*2, height/80*6,height/80*5);    //털
fill(#818181);
ellipse(px-height/80*4, py-height/80, height/80*5,height/80*6);    //머리
strokeWeight(5);
stroke(#5A5A5A);
noFill();
arc(px-height/80*7, py-height/80*3,height/80*2,height/80*2,radians(0),radians(90));
arc(px-height/80, py-height/80*3,height/80*2,height/80*2,radians(90),radians(180));    //귀
stroke(0);
fill(0);
ellipse(px-height/80*5, py-height/80, height/80/4,height/80/2);
ellipse(px-height/80*3, py-height/80, height/80/4,height/80/2);    //눈

//머리털 그리기
