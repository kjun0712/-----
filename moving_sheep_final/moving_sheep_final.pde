void setup(){
  size(1000,800);
  g=height/120;    //잔디 모눈 한칸값
  s=height/80;    //양 모눈 한칸값
  sx2=width/3; sy2=height*2/3;    //첫째양의 x,y좌표
  sx1=width*3/4; sy1=height*2/3;    //둘째양의 x,y좌표
  a=225; b=100; c=219;    //꽃의 초기 RGB 값
  sdx2=1; sdy2=1; ss2=4;    //첫째양의 x,y좌표 이동방향, 첫째양의 속도
  sdx1=-1; sdy1=1; ss1=6;    //두번째양의 x,y좌표 이동방향, 두번째양의 속도
}

int g;    //잔디 모눈 한칸값
int s;    //양 모눈 한칸값
float sx1,sy1;    //양1의 x,y좌표
float sx2,sy2;    //양2의 x,y좌표
int i,t;    //
float a,b,c;    //꽃의 초기 RGB 값
float sdx2,sdy2,ss2;    //양2의 x,y좌표 이동방향, 양2의 속도
float sdx1,sdy1,ss1;    //양1의 x,y좌표 이동방향, 양1의 속도

void lawn(float R, float G, float B){    //잔디밭
  background(#47E35F);
  stroke(0);
  
  for(i=g*5; i<width; i+=g*15){    //홀수줄 생성 반복문 가로줄
    for(t=g*5; t<=height; t+=g*10){    //홀수줄 생성 반복문 세로줄
      grass(i,t,g,R,G,B);
    }
  }
  for(i=0; i<width; i+=g*15){    //짝수줄 생성 반복문 가로줄
    for(t=0; t<=height; t+=g*10){    //짝수줄 생성 반복문 세로줄
      grass(i,t,g,R,G,B);
    }
  }
}

void grass(int x, int y, int f,float R, float G, float B){    //잔디
  fill(#24AA00);    //잔디색: 초록색
  triangle(x+g,y,x+g*3,y,x+g*2,y-g*4);    //잔디그리기1
  triangle(x,y,x+g*5,y,x+g,y-g*3);    //잔디그리기2
  triangle(x+g,y,x+g*2,y,x+g,y-g*3);    //잔디그리기3
  
  fill(#24AA00);    //잔디색: 초록색
  triangle(x+g*6,y,x+g*8,y,x+g*7,y-g*4);    //잔디그리기1
  triangle(x+g*5,y,x+g*10,y,x+g*6,y-g*3);    //잔디그리기2
  triangle(x+g*6,y,x+g*7,y,x+g*6,y-g*3);    //잔디그리기3

  fill(R, G, B);    //꽃잎색
  ellipse(x+f*7,y-g*4,g*3,g*3);    //꽃잎 그리기
  fill(#C14CA6);    //꽃중앙색: 진한분홍색
  ellipse(x+g*7,y-g*4,g,g);   //꽃중앙 그리기
}

void flower_color(float sx){    //꽃의 색깔
  a = 95 + (255-95)/float(width)*sx;    //R
  b = 57 + (255-57)/float(width)*sx;    //G
  c = 86 + (255-86)/float(width)*sx;    //B
}

void sheep(float sx,float sy,float sd){    //양
  if(sd==1){    //오른쪽으로 갈때 
    strokeWeight(10);
    stroke(#5A5A5A);    //다리색: 진회색
    line(sx-s*5, sy+s*4,sx-s*5, sy+s*8);    //다리그리기1
    line(sx-s*3, sy+s*4,sx-s*3, sy+s*8);    //다리그리기2
    line(sx, sy+s*4,sx, sy+s*8);    //다리그리기3
    line(sx+s*2, sy+s*4,sx+s*2, sy+s*8);    //다리 그리기4
  
    fill(255);    //몸통색: 흰색
    stroke(255);    //몸통의 원 라인색: 흰색
    ellipse(sx-s, sy, s*8,s*8);    //매인몸통 그리기

    ellipse(sx+s*4, sy, s*4,s*6);    //몸통털그리기1
    ellipse(sx+s*2, sy+s*3, s*5,s*6);    //몸통털그리기2
    ellipse(sx-s, sy+s*4, s*4,s*4);    //몸통털그리기3
    ellipse(sx-s*3, sy+s*4, s*4,s*4);    //몸통털그리기4
    ellipse(sx-s*5, sy+s*3, s*4,s*4);    //몸통털그리기5
    ellipse(sx-s*6, sy+s, s*4,s*4);    //몸통털그리기6
    ellipse(sx-s*5, sy-s, s*4,s*4);    //몸통털그리기7
    ellipse(sx-s*3, sy-s*2, s*6,s*5);    //몸통털그리기8
  
    fill(#818181);    //머리색: 회색
    ellipse(sx+s*2, sy-s, s*5,s*6);    //머리

    strokeWeight(10);    //귀굵기: 10
    stroke(#5A5A5A);    //귀색: 진회색
    noFill();    //귀 채우지 않기
    arc(sx-s, sy-s*3,s*2,s*2,radians(0),radians(90));    //왼쪽귀
    arc(sx+s*5,sy-s*3,s*2,s*2,radians(90),radians(180));    //오른쪽귀

    strokeWeight(5);    //눈 굵기: 5
    stroke(0);    //눈의 원 라인색: 검은색
    fill(0);    //눈색: 검은색
    ellipse(sx+s, sy-s, s/4,s/2);    //왼쪽눈
    ellipse(sx+s*3, sy-s, s/4,s/2);    //오른쪽눈

    strokeWeight(1);    //코,인중,입 굵기: 1
    noFill();    //코, 입 채우지 않기
    arc(sx+s*2, sy-s/2,s,s,radians(45),radians(135));    //코그리기
    line(sx+s*2, sy+s/4,sx+s*2, sy+s/2);    //인중그리기
    arc(sx+s*2, sy+s/4,s,s,radians(35),radians(145));    //입그리기

    fill(255);    //머리털색: 흰색
    stroke(255);    //머리털의 원 라인색: 흰색
    ellipse(sx+s*2, sy-s*9/2, s*4,s*3);    //머리털그리기1
    ellipse(sx+s*4, sy-s*7/2, s*2,s*2);    //머리털그리기2
    ellipse(sx, sy-s*7/2, s*2,s*2);    //머리털그리기3
  }else if(sd==-1){    //왼쪽으로 갈때
    strokeWeight(10);
    stroke(#5A5A5A);    //다리색: 진회색
    line(sx-s*3, sy+s*4,sx-s*3, sy+s*8);    //다리그리기1
    line(sx-s, sy+s*4,sx-s, sy+s*8);    //다리그리기2
    line(sx+s*2, sy+s*4,sx+s*2, sy+s*8);    //다리그리기3
    line(sx+s*4, sy+s*4,sx+s*4, sy+s*8);    //다리 그리기4

    fill(255);    //몸통색: 흰색
    stroke(255);    //몸통의 원 라인색: 흰색
    ellipse(sx+s, sy, s*8,s*8);    //매인몸통 그리기

    ellipse(sx-s*5, sy, s*4,s*6);    //몸통털그리기1
    ellipse(sx-s*3, sy+s*3, s*5,s*6);    //몸통털그리기2
    ellipse(sx, sy+s*4, s*4,s*4);    //몸통털그리기3
    ellipse(sx+s*2, sy+s*4, s*4,s*4);    //몸통털그리기4
    ellipse(sx+s*4, sy+s*3, s*4,s*4);    //몸통털그리기5
    ellipse(sx+s*5, sy+s, s*4,s*4);    //몸통털그리기6
    ellipse(sx+s*4, sy-s, s*4,s*4);    //몸통털그리기7
    ellipse(sx+s*2, sy-s*2, s*6,s*5);    //몸통털그리기8

    fill(#818181);    //머리색: 회색
    ellipse(sx-s*3, sy-s, s*5,s*6);    //머리

    strokeWeight(10);    //귀굵기: 10
    stroke(#5A5A5A);    //귀색: 진회색
    noFill();    //귀 채우지 않기
    arc(sx-s*6, sy-s*3,s*2,s*2,radians(0),radians(90));    //왼쪽귀
    arc(sx,sy-s*3,s*2,s*2,radians(90),radians(180));    //오른쪽귀

    strokeWeight(5);    //눈 굵기: 5
    stroke(0);    //눈의 원 라인색: 검은색
    fill(0);    //눈색: 검은색
    ellipse(sx-s*4, sy-s, s/4,s/2);    //왼쪽눈
    ellipse(sx-s*2, sy-s, s/4,s/2);    //오른쪽눈

    strokeWeight(1);    //코,인중,입 굵기: 1
    noFill();    //코, 입 채우지 않기
    arc(sx-s*3, sy-s/2,s,s,radians(45),radians(135));    //코그리기
    line(sx-s*3, sy+s/4,sx-s*3, sy+s/2);    //인중그리기
    arc(sx-s*3, sy+s/4,s,s,radians(35),radians(145));    //입그리기

    fill(255);    //머리털색: 흰색
    stroke(255);    //머리털의 원 라인색: 흰색
    ellipse(sx-s*3, sy-s*9/2, s*4,s*3);    //머리털그리기1
    ellipse(sx-s, sy-s*7/2, s*2,s*2);    //머리털그리기2
    ellipse(sx-s*5, sy-s*7/2, s*2,s*2);    //머리털그리기3
  }
}

void sheep_head(float sx,float sy,float sd){    //양머리
  if(sd==1){    //오른쪽으로 갈때
    noStroke();
    fill(#818181);    //머리색: 회색
    ellipse(sx+s*2, sy-s, s*5,s*6);    //머리

    strokeWeight(10);    //귀굵기: 10
    stroke(#5A5A5A);    //귀색: 진회색
    noFill();    //귀 채우지 않기
    arc(sx-s, sy-s*3,s*2,s*2,radians(0),radians(90));    //왼쪽귀
    arc(sx+s*5,sy-s*3,s*2,s*2,radians(90),radians(180));    //오른쪽귀

    strokeWeight(5);    //눈 굵기: 5
    stroke(0);    //눈의 원 라인색: 검은색
    fill(0);    //눈색: 검은색
    ellipse(sx+s, sy-s, s/4,s/2);    //왼쪽눈
    ellipse(sx+s*3, sy-s, s/4,s/2);    //오른쪽눈

    strokeWeight(1);    //코,인중,입 굵기: 1
    noFill();    //코, 입 채우지 않기
    arc(sx+s*2, sy-s/2,s,s,radians(45),radians(135));    //코그리기
    line(sx+s*2, sy+s/4,sx+s*2, sy+s/2);    //인중그리기
    arc(sx+s*2, sy+s/4,s,s,radians(35),radians(145));    //입그리기

    fill(255);    //머리털색: 흰색
    stroke(255);    //머리털의 원 라인색: 흰색
    ellipse(sx+s*2, sy-s*9/2, s*4,s*3);    //머리털그리기1
    ellipse(sx+s*4, sy-s*7/2, s*2,s*2);    //머리털그리기2
    ellipse(sx, sy-s*7/2, s*2,s*2);    //머리털그리기3
  }else if(sd==-1){    //왼쪽으로 갈때
    noStroke();
    fill(#818181);    //머리색: 회색
    ellipse(sx-s*3, sy-s, s*5,s*6);    //머리

    strokeWeight(10);    //귀굵기: 10
    stroke(#5A5A5A);    //귀색: 진회색
    noFill();    //귀 채우지 않기
    arc(sx-s*6, sy-s*3,s*2,s*2,radians(0),radians(90));    //왼쪽귀
    arc(sx,sy-s*3,s*2,s*2,radians(90),radians(180));    //오른쪽귀

    strokeWeight(5);    //눈 굵기: 5
    stroke(0);    //눈의 원 라인색: 검은색
    fill(0);    //눈색: 검은색
    ellipse(sx-s*4, sy-s, s/4,s/2);    //왼쪽눈
    ellipse(sx-s*2, sy-s, s/4,s/2);    //오른쪽눈

    strokeWeight(1);    //코,인중,입 굵기: 1
    noFill();    //코, 입 채우지 않기
    arc(sx-s*3, sy-s/2,s,s,radians(45),radians(135));    //코그리기
    line(sx-s*3, sy+s/4,sx-s*3, sy+s/2);    //인중그리기
    arc(sx-s*3, sy+s/4,s,s,radians(35),radians(145));    //입그리기

    fill(255);    //머리털색: 흰색
    stroke(255);    //머리털의 원 라인색: 흰색
    ellipse(sx-s*3, sy-s*9/2, s*4,s*3);    //머리털그리기1
    ellipse(sx-s, sy-s*7/2, s*2,s*2);    //머리털그리기2
    ellipse(sx-s*5, sy-s*7/2, s*2,s*2);    //머리털그리기3
  }
}

void draw(){
  lawn(a,b,c);    //잔디밭 그리기

  //첫째양 움직이기
  sx2=sx2+ss2*sdx2;    //x축 속도
  sy2=sy2+ss2*0.1*sdy2;    //y축 속도
  if((sx2>width-s*8)||(sx2<s*8)){    //벽에 부딧혔을때
    sdx2=-sdx2;    //x축 방향이 바뀜
  }
  sheep(sx2,sy2,sdx2);    //양 그리기
  
  if((sy2>height-s*9)||(sy2<s*6)){    //벽에 부딧혔을때
    sdy2=-sdy2;    //y축 방향이 바뀜
  }
  
  //둘째양 움직이기
  sx1=sx1+ss1*sdx1;    //x축 속도
  sy1=sy1+ss1*0.1*sdy1;    //y축 속도
  if((sx1>width-s*8)||(sx1<s*8)){    //벽에 부딧혔을때
    sdx1=-sdx1;    //x축 방향이 바뀜
  }
  sheep(sx1,sy1,sdx1);    //양 그리기
  
  if((sy1>height-s*9)||(sy1<s*6)){    //벽에 부딧혔을때
    sdy1=-sdy1;    //y축 방향이 바뀜
  }
  
  //두양이 충돌하면 방향이 바뀝니다
  if(sdx1!=sdx2 && sx2-s*13<sx1 && sx1<sx2+s*13 && sy2-s*15<sy1&&sy1<sy2+s*16){    //두 양이 충돌했을때
    sdx1=-sdx1;    //첫째양의 방향이 바뀐다
    sdx2=-sdx2;    //둘째양의 방향이 바뀐다
    
    flower_color(sx1);    //꽃의 색깔이 바뀐다
  }
}
