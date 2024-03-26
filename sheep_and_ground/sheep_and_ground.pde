size(800,800);
int px=width/2;
int py=height/2;

int g=height/120;    //잔디 모눈 한칸값
int s=height/80;    //양 모눈 한칸값

int sx=width/2;    //양의 x좌표
int sy=height*3/4;    //양의 y좌표

background(#81E3FF);    //하늘색 설정
fill(#24AA00);    //땅 색설정
rect(0,py,width,height);    //땅범위설정

for(int i=0; i<width; i+=g*5){
    for(int t=py; t<height; t+=g*5){
      if(i<sx+g*10){
         if(i>sx-g*15){
            if(t<sy+g*20){
               if(t>sy-g*15){
                 continue;
               }
             }
           }
         }
      fill(#24AA00);    //잔디색설정
      triangle(i+g,t,i+g*3,t,i+g*2,t-g*4);
      triangle(i,t,i+g*5,t,i+g,t-g*3);
      triangle(i+g,t,i+g*2,t,i+g,t-g*3);
      /*
      fill(#FF64DB);    //꽃잎색설정
      ellipse(i+g*2,t-g*4,g*3,g*3);
      fill(#C14CA6);    //꽃중앙색설정
      ellipse(i+g*2,t-g*4,g,g);   //꽃
      */
    }
  }    //잔디그리기


//양 그리기

strokeWeight(10);
stroke(#5A5A5A);
line(sx-s*3, sy+s*4,sx-s*3, sy+s*8);
line(sx-s, sy+s*4,sx-s, sy+s*8);
line(sx+s*2, sy+s*4,sx+s*2, sy+s*8);
line(sx+s*4, sy+s*4,sx+s*4, sy+s*8);    //다리 

fill(255);
stroke(255);
ellipse(sx+s, sy, s*8,s*8);    //매인몸통

ellipse(sx-s*5, sy, s*4,s*6);
ellipse(sx-s*3, sy+s*3, s*5,s*6);
ellipse(sx, sy+s*4, s*4,s*4);
ellipse(sx+s*2, sy+s*4, s*4,s*4);
ellipse(sx+s*4, sy+s*3, s*4,s*4);
ellipse(sx+s*5, sy+s, s*4,s*4);
ellipse(sx+s*4, sy-s, s*4,s*4);
ellipse(sx+s*2, sy-s*2, s*6,s*5);    //몸통털

fill(#818181);
ellipse(sx-s*3, sy-s, s*5,s*6);    //머리

strokeWeight(10);
stroke(#5A5A5A);
noFill();
arc(sx-s*6, sy-s*3,s*2,s*2,radians(0),radians(90));
arc(sx,sy-s*3,s*2,s*2,radians(90),radians(180));    //귀

strokeWeight(5);
stroke(0);
fill(0);
ellipse(sx-s*4, sy-s, s/4,s/2);
ellipse(sx-s*2, sy-s, s/4,s/2);    //눈

strokeWeight(1);
noFill();
arc(sx-s*3, sy-s/2,s,s,radians(45),radians(135));
line(sx-s*3, sy+s/4,sx-s*3, sy+s/2);
arc(sx-s*3, sy+s/4,s,s,radians(35),radians(145));//코,입

fill(255);
stroke(255);
ellipse(sx-s*3, sy-s*9/2, s*4,s*3);
ellipse(sx-s, sy-s*7/2, s*2,s*2);
ellipse(sx-s*5, sy-s*7/2, s*2,s*2);    //머리털
