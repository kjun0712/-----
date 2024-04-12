void setup(){
  size(1000,800);
  g=height/120;    //잔디 모눈 한칸값
  s=height/80;    //양 모눈 한칸값
  sx2=width/3; sy2=height*2/3;    //첫째양의 x,y좌표
  sx1=width*3/4; sy1=height*2/3;    //둘째양의 x,y좌표
  sdx2=1; sdy2=1; ss2=4;    //첫째양의 x,y좌표 이동방향, 첫째양의 속도
  sdx1=-1; sdy1=1; ss1=6;    //두번째양의 x,y좌표 이동방향, 두번째양의 속도
}

int g;    //잔디 모눈 한칸값
int s;    //양 모눈 한칸값
float sx1,sy1;    //양1의 x,y좌표
float sx2,sy2;    //양2의 x,y좌표
int i,t;
float sdx2,sdy2,ss2;    //양2의 x,y좌표 이동방향, 양2의 속도
float sdx1,sdy1,ss1;    //양1의 x,y좌표 이동방향, 양1의 속도

void grass(){    //짝수층 잔디
  fill(#24AA00);    //잔디색: 초록색
  triangle(i+g,t,i+g*3,t,i+g*2,t-g*4);    //잔디그리기1
  triangle(i,t,i+g*5,t,i+g,t-g*3);    //잔디그리기2
  triangle(i+g,t,i+g*2,t,i+g,t-g*3);    //잔디그리기3
}

void flower(){    //짝수층 꽃
  fill(#24AA00);    //잔디색: 초록색
  triangle(i+g*6,t,i+g*8,t,i+g*7,t-g*4);    //잔디그리기1
  triangle(i+g*5,t,i+g*10,t,i+g*6,t-g*3);    //잔디그리기2
  triangle(i+g*6,t,i+g*7,t,i+g*6,t-g*3);    //잔디그리기3
      
  fill(#FF64DB);    //꽃잎색: 분홍색
  ellipse(i+g*7,t-g*4,g*3,g*3);    //꽃잎 그리기
  fill(#C14CA6);    //꽃중앙색: 진한분홍색
  ellipse(i+g*7,t-g*4,g,g);   //꽃중앙 그리기
}


void sheep_r(float sx,float sy){
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
}

void sheep_l(float sx,float sy){
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

void draw(){
  background(#47E35F);
  stroke(0);
  
  for(i=g*5; i<width; i+=g*15){    //생성 반복문 가로줄
    for(t=g*5; t<=height; t+=g*10){    //생성 반복문 세로줄
      grass();
      flower();
    }
  }
  for(i=0; i<width; i+=g*15){    //생성 반복문 가로줄
    for(t=0; t<=height; t+=g*10){    //생성 반복문 세로줄
      grass();
      flower();
    }
  }

  //첫째양이 움직입니다
  sx2=sx2+ss2*sdx2;
  sy2=sy2+ss2*0.1*sdy2;
  if((sx2>width-s*7)||(sx2<s*7)){
    sdx2=-sdx2;
  }if(sdx2==1){
    sheep_r(sx2,sy2);
  }else if(sdx2==-1){
    sheep_l(sx2,sy2);
  }
  if((sy2>height-s*9)||(sy2<s*6)){
    sdy2=-sdy2;
  }
  
  //둘째양이 움직입니다
  sx1=sx1+ss1*sdx1;
  sy1=sy1+ss1*0.1*sdy1;
  if((sx1>width-s*7)||(sx1<s*7)){
    sdx1=-sdx1;
  }if(sdx1==1){
    sheep_r(sx1,sy1);
  }else if(sdx1==-1){
    sheep_l(sx1,sy1);
  }
  if((sy1>height-s*9)||(sy1<s*6)){
    sdy1=-sdy1;
  }
  
  //두양이 충돌하면 방향이 바뀝니다
  if(sdx1!=sdx2 && sx1<sx2+s*13 && sy2-s*15<sy1&&sy1<sy2+s*16){
    sdx1=-sdx1;
    sdx2=-sdx2;
  }
  
  if(sdx1==1 && sdx2==1){
    if(sx1>sx2){
      sx1=sx1+ss1*0.2*sdx1;
      sx2=sx2-ss2*0.4*sdx2;
    }else{
      sx1=sx1-ss1*0.4*sdx1;
      sx2=sx2+ss2*0.2*sdx2;
    }
  if(sdx1==-1 && sdx2==-1){
    if(sx1>sx2){
      sx1=sx1-ss1*0.4*sdx1;
      sx2=sx2+ss2*0.2*sdx2;
    }else{
      sx1=sx1+ss1*0.2*sdx1;
      sx2=sx2-ss2*0.4*sdx2;
    }
  }
}
