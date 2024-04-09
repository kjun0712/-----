void setup(){
  size(1000,800);
  py=0;    //지평선위치설정
  g=height/120;    //잔디 모눈 한칸값
  s=height/80;    //양 모눈 한칸값
  sx1=width*3/4;    //양1의 x좌표
  sy1=height*2/3;    //양1의 y좌표
  sx2=width/3;    //양2의 x좌표
  sy2=height*2/3;    //양2의 y좌표
}
int py;    //지평선위치설정
int g;    //잔디 모눈 한칸값
int s;    //양 모눈 한칸값
int sx1;    //양1의 x좌표
int sy1;    //양1의 y좌표
int sx2;    //양2의 x좌표
int sy2;    //양2의 y좌표
int i,t;

void grass1(){
      fill(#24AA00);    //잔디색: 초록색
      triangle(i+g*6,t,i+g*8,t,i+g*7,t-g*4);    //잔디그리기1
      triangle(i+g*5,t,i+g*10,t,i+g*6,t-g*3);    //잔디그리기2
      triangle(i+g*6,t,i+g*7,t,i+g*6,t-g*3);    //잔디그리기3
}

void grass2(){
      fill(#24AA00);    //잔디색: 초록색
      triangle(i+g*6,t,i+g*8,t,i+g*7,t-g*4);    //잔디그리기1
      triangle(i+g*5,t,i+g*10,t,i+g*6,t-g*3);    //잔디그리기2
      triangle(i+g*6,t,i+g*7,t,i+g*6,t-g*3);    //잔디그리기3
}

void flower1(){
  fill(#24AA00);    //잔디색: 초록색
  triangle(i+g,t,i+g*3,t,i+g*2,t-g*4);    //잔디그리기1
  triangle(i,t,i+g*5,t,i+g,t-g*3);    //잔디그리기2
  triangle(i+g,t,i+g*2,t,i+g,t-g*3);    //잔디그리기3
      
  fill(#FF64DB);    //꽃잎색: 분홍색
  ellipse(i+g*7,t-g*4,g*3,g*3);    //꽃잎 그리기
  fill(#C14CA6);    //꽃중앙색: 진한분홍색
  ellipse(i+g*7,t-g*4,g,g);   //꽃중앙 그리기
}

void flower2(){
  fill(#24AA00);    //잔디색: 초록색
  triangle(i+g,t,i+g*3,t,i+g*2,t-g*4);    //잔디그리기1
  triangle(i,t,i+g*5,t,i+g,t-g*3);    //잔디그리기2
  triangle(i+g,t,i+g*2,t,i+g,t-g*3);    //잔디그리기3
      
  fill(#FF64DB);    //꽃잎색: 분홍색
  ellipse(i+g*7,t-g*4,g*3,g*3);    //꽃잎 그리기
  fill(#C14CA6);    //꽃중앙색: 진한분홍색
  ellipse(i+g*7,t-g*4,g,g);   //꽃중앙 그리기
}

void sheep1(){
  strokeWeight(10);
  stroke(#5A5A5A);    //다리색: 진회색
  line(sx1-s*3, sy1+s*4,sx1-s*3, sy1+s*8);    //다리그리기1
  line(sx1-s, sy1+s*4,sx1-s, sy1+s*8);    //다리그리기2
  line(sx1+s*2, sy1+s*4,sx1+s*2, sy1+s*8);    //다리그리기3
  line(sx1+s*4, sy1+s*4,sx1+s*4, sy1+s*8);    //다리 그리기4

  fill(255);    //몸통색: 흰색
  stroke(255);    //몸통의 원 라인색: 흰색
  ellipse(sx1+s, sy1, s*8,s*8);    //매인몸통 그리기

  ellipse(sx1-s*5, sy1, s*4,s*6);    //몸통털그리기1
  ellipse(sx1-s*3, sy1+s*3, s*5,s*6);    //몸통털그리기2
  ellipse(sx1, sy1+s*4, s*4,s*4);    //몸통털그리기3
  ellipse(sx1+s*2, sy1+s*4, s*4,s*4);    //몸통털그리기4
  ellipse(sx1+s*4, sy1+s*3, s*4,s*4);    //몸통털그리기5
  ellipse(sx1+s*5, sy1+s, s*4,s*4);    //몸통털그리기6
  ellipse(sx1+s*4, sy1-s, s*4,s*4);    //몸통털그리기7
  ellipse(sx1+s*2, sy1-s*2, s*6,s*5);    //몸통털그리기8

  fill(#818181);    //머리색: 회색
  ellipse(sx1-s*3, sy1-s, s*5,s*6);    //머리

  strokeWeight(10);    //귀굵기: 10
  stroke(#5A5A5A);    //귀색: 진회색
  noFill();    //귀 채우지 않기
  arc(sx1-s*6, sy1-s*3,s*2,s*2,radians(0),radians(90));    //왼쪽귀
  arc(sx1,sy1-s*3,s*2,s*2,radians(90),radians(180));    //오른쪽귀

  strokeWeight(5);    //눈 굵기: 5
  stroke(0);    //눈의 원 라인색: 검은색
  fill(0);    //눈색: 검은색
  ellipse(sx1-s*4, sy1-s, s/4,s/2);    //왼쪽눈
  ellipse(sx1-s*2, sy1-s, s/4,s/2);    //오른쪽눈

  strokeWeight(1);    //코,인중,입 굵기: 1
  noFill();    //코, 입 채우지 않기
  arc(sx1-s*3, sy1-s/2,s,s,radians(45),radians(135));    //코그리기
  line(sx1-s*3, sy1+s/4,sx1-s*3, sy1+s/2);    //인중그리기
  arc(sx1-s*3, sy1+s/4,s,s,radians(35),radians(145));    //입그리기

  fill(255);    //머리털색: 흰색
  stroke(255);    //머리털의 원 라인색: 흰색
  ellipse(sx1-s*3, sy1-s*9/2, s*4,s*3);    //머리털그리기1
  ellipse(sx1-s, sy1-s*7/2, s*2,s*2);    //머리털그리기2
  ellipse(sx1-s*5, sy1-s*7/2, s*2,s*2);    //머리털그리기3
}

void sheep2(){
    strokeWeight(10);
  stroke(#5A5A5A);    //다리색: 진회색
  line(sx2-s*5, sy2+s*4,sx2-s*5, sy2+s*8);    //다리그리기1
  line(sx2-s*3, sy2+s*4,sx2-s*3, sy2+s*8);    //다리그리기2
  line(sx2, sy2+s*4,sx2, sy2+s*8);    //다리그리기3
  line(sx2+s*2, sy2+s*4,sx2+s*2, sy2+s*8);    //다리 그리기4
  

  fill(255);    //몸통색: 흰색
  stroke(255);    //몸통의 원 라인색: 흰색
  ellipse(sx2-s, sy2, s*8,s*8);    //매인몸통 그리기

  ellipse(sx2+s*4, sy2, s*4,s*6);    //몸통털그리기1
  ellipse(sx2+s*2, sy2+s*3, s*5,s*6);    //몸통털그리기2
  ellipse(sx2-s, sy2+s*4, s*4,s*4);    //몸통털그리기3
  ellipse(sx2-s*3, sy2+s*4, s*4,s*4);    //몸통털그리기4
  ellipse(sx2-s*5, sy2+s*3, s*4,s*4);    //몸통털그리기5
  ellipse(sx2-s*6, sy2+s, s*4,s*4);    //몸통털그리기6
  ellipse(sx2-s*5, sy2-s, s*4,s*4);    //몸통털그리기7
  ellipse(sx2-s*3, sy2-s*2, s*6,s*5);    //몸통털그리기8
  
  fill(#818181);    //머리색: 회색
  ellipse(sx2+s*2, sy2-s, s*5,s*6);    //머리

  strokeWeight(10);    //귀굵기: 10
  stroke(#5A5A5A);    //귀색: 진회색
  noFill();    //귀 채우지 않기
  arc(sx2-s, sy2-s*3,s*2,s*2,radians(0),radians(90));    //왼쪽귀
  arc(sx2+s*5,sy2-s*3,s*2,s*2,radians(90),radians(180));    //오른쪽귀

  strokeWeight(5);    //눈 굵기: 5
  stroke(0);    //눈의 원 라인색: 검은색
  fill(0);    //눈색: 검은색
  ellipse(sx2+s, sy2-s, s/4,s/2);    //왼쪽눈
  ellipse(sx2+s*3, sy2-s, s/4,s/2);    //오른쪽눈

  strokeWeight(1);    //코,인중,입 굵기: 1
  noFill();    //코, 입 채우지 않기
  arc(sx2+s*2, sy2-s/2,s,s,radians(45),radians(135));    //코그리기
  line(sx2+s*2, sy2+s/4,sx2+s*2, sy2+s/2);    //인중그리기
  arc(sx2+s*2, sy2+s/4,s,s,radians(35),radians(145));    //입그리기

  fill(255);    //머리털색: 흰색
  stroke(255);    //머리털의 원 라인색: 흰색
  ellipse(sx2+s*2, sy2-s*9/2, s*4,s*3);    //머리털그리기1
  ellipse(sx2+s*4, sy2-s*7/2, s*2,s*2);    //머리털그리기2
  ellipse(sx2, sy2-s*7/2, s*2,s*2);    //머리털그리기3
}


void draw(){
  background(#47E35F);
  stroke(0);
  
  for(i=g*5; i<width; i+=g*15){    //생성 반복문 가로줄
    for(t=g*5; t<=height; t+=g*10){    //생성 반복문 세로줄
      grass2();
      flower2();
    }
  }
  for(i=0; i<width; i+=g*15){    //생성 반복문 가로줄
    for(t=0; t<=height; t+=g*10){    //생성 반복문 세로줄
      grass1();
      flower1();
    }
  }
  sheep1();
  sheep2();
}
