void setup(){
  size(1000,800);
  g=height/120;    //잔디 모눈 한칸값
  s=height/80;    //양 모눈 한칸값
  sx1=random(s*8,width-s*8); sy1=random(s*8,height-s*8);    //양1의 x,y좌표
  sx2=random(s*8,width-s*8); sy2=random(s*8,height-s*8);    //양2의 x,y좌표
  sdx1=1; sdy1=1; ss1=random(3,6);    //양1의 x,y좌표 이동방향, 양1의 속도, 점프속도, 점프좌표
  sdx2=-1; sdy2=1; ss2=random(2,4);    //양2의 x,y좌표 이동방향, 양2의 속도, 점프속도, 점프좌표
  p=1; m=-1;
}

int g;    //잔디 모눈 한칸값
int s;    //양 모눈 한칸값
float sx1,sy1;    //양1의 x,y좌표
float sx2,sy2;    //양2의 x,y좌표
float sdx1,sdy1,ss1,sa1,sjy1;    //양1의 x,y좌표 이동방향, 속도, 점프속도, 점프좌표
float sfl1,sbl1;    //양1 다리 각
float sdx2,sdy2,ss2,sa2,sjy2;    //양2의 x,y좌표 이동방향, 속도, 점프속도, 점프좌표
float sfl2,sbl2;    //양2 다리 각
float p,m;

int start=-2000;
int timer=2000;

int k;


void draw(){
  background(#00FF00);
  
  randomSeed(10);
  for(int m=0; m<100; m++){
    stroke(0);
    grass(random(width),random(height));
    flower(random(width),random(height),random(256),random(256),random(256));
  }
  
  sheep(sx1,sjy1,sdx1,sfl1,sbl1);
  sheep(sx2,sjy2,sdx2,sfl2,sbl2);
  
  int time=millis();
  
  if(time-start<timer){
    k++;
  }else{
    if(k!=0){
      k=0;
    }
    //양1 x축 움직임
    sx1+=ss1*sdx1;    //x축이동
    if(sx1+s*6>width || sx1-s*6<0){
      sdx1*=-1;
    }
  
    //양1 y축 움직임
    sa1+=ss1*0.02;    //점프속도
    sy1+=+ss1*0.1*sdy1;    //y축 이동
    sjy1=sy1-abs(sin(sa1))*s*5;    //점프
    if(sy1+s*6>height || sy1-s*6<0){
      sdy1*=-1;
    }
  
    //양1 다리 각도
    sfl1+=ss1*0.01*p;
    sbl1+=ss1*0.01*m;
    if(sfl1>60 || sfl1<0){
      p*=-1;
    }else if(sbl1<-60 || sbl1>0){
      m*=-1;
    }
  }
  
  
  if(time-start>1000 && time-start<timer){
  }else{
    //양2 x축 움직임
    sx2+=ss2*sdx2;    //x축이동
    if(sx2+s*6>width || sx2-s*6<0){
      sdx2*=-1;
    }
  
    //양2 y축 움직임
    sa2+=ss2*0.02;    //y축이동
    sy2+=+ss2*0.1*sdy2;    //점프속도
    sjy2=sy2-abs(sin(sa2))*s*5;    //점프
    if(sy2+s*6>height || sy2-s*6<0){
      sdy2*=-1;
    }
  
    //양2 다리 각도
    sfl2+=ss2*0.01*p;
    sbl2+=ss2*0.01*m;
  
    if(sfl2>60 || sfl2<0){
      p*=-1;
    }else if(sbl2<-60 || sbl2>0){
      m*=-1;
    }
  }
  
  if(sdx1!=sdx2 && sx2-s*13<sx1 && sx1<sx2+s*13 && sy2-s*15<sy1&&sy1<sy2+s*16 && k==0){    //두 양이 충돌했을때
    sdx1=-sdx1;    //첫째양의 방향이 바뀐다
    sdx2=-sdx2;    //둘째양의 방향이 바뀐다
    start=millis();
  }
}


void grass(float gi,float gt){    //잔디밭
  fill(#24AA00);    //잔디색: 초록색
  triangle(gi+g,gt,gi+g*3,gt,gi+g*2,gt-g*4);    //잔디그리기1
  triangle(gi,gt,gi+g*5,gt,gi+g,gt-g*3);    //잔디그리기2
  triangle(gi+g,gt,gi+g*2,gt,gi+g,gt-g*3);    //잔디그리기3
}

void flower(float fi,float ft,float R,float G,float B){    //꽃
  fill(#24AA00);    //잔디색: 초록색
  triangle(fi+g*6,ft,fi+g*8,ft,fi+g*7,ft-g*4);    //잔디그리기1
  triangle(fi+g*5,ft,fi+g*10,ft,fi+g*6,ft-g*3);    //잔디그리기2
  triangle(fi+g*6,ft,fi+g*7,ft,fi+g*6,ft-g*3);    //잔디그리기3
      
  fill(R,G,B);    //꽃잎색: 분홍색
  ellipse(fi+g*7,ft-g*4,g*3,g*3);    //꽃잎 그리기
  fill(#C14CA6);    //꽃중앙색: 진한분홍색
  ellipse(fi+g*7,ft-g*4,g,g);   //꽃중앙 그리기
}

void sheep(float sx,float sy,float sd,float sfl,float sbl){
  if(sd==1){
    pushMatrix();
    translate(sx-s*4,sy);
    rotate(radians(sfl));
    strokeWeight(10);
    stroke(#5A5A5A);    //다리색: 진회색
    line(-s, s*4,-s, s*8);    //다리그리기1
    line(s, s*4,s, s*8);    //다리그리기2
    popMatrix();
    
    pushMatrix();
    translate(sx+s*2,sy);
    rotate(radians(sbl));
    strokeWeight(10);
    stroke(#5A5A5A);    //다리색: 진회색
    line(-s, s*4,-s, s*8);    //다리그리기3
    line(s, s*4,s, s*8);    //다리 그리기4
    popMatrix();
    
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
  }else if(sd==-1){
    pushMatrix();
    translate(sx-s*2,sy);
    rotate(radians(sfl));
    strokeWeight(10);
    stroke(#5A5A5A);    //다리색: 진회색
    line(-s, s*4,-s, s*8);    //다리그리기1
    line(s, s*4,s, s*8);    //다리그리기2
    popMatrix();
    
    pushMatrix();
    translate(sx+s*3,sy);
    rotate(radians(sbl));
    strokeWeight(10);
    stroke(#5A5A5A);    //다리색: 진회색
    line(-s, s*4,-s, s*8);    //다리그리기3
    line(s, s*4,s, s*8);    //다리 그리기4
    popMatrix();
    
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
