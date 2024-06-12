void setup(){
  size(1600,800);
  g=height/120;    //잔디 모눈 한칸값
  s=height/160;    //양 모눈 한칸값
  
  sx=new float[100];
  sy=new float[100];
  ss=new float[100];
  sdx=new float[100];
  sdy=new float[100];
  
  gx=new float[100];
  gy=new float[100];
  
  tc=new float[100];
  ts=new float[100];
  
  for(int m=0; m<100; m++){
    sx[m]=random(s*8,width-s*8);
    sy[m]=random(s*8,height-s*8);
    ss[m]=random(2,8);
    sdx[m]=1;
    sdy[m]=1;
    
    gx[m]=random(width);
    gy[m]=random(height);
    
    tc[m]=0; 
    ts[m]=15;
  }
  
  p=1;
  
  t=1;
}

float g;    //잔디 모눈 한칸값
float s;    //양 모눈 한칸값

float sx[],sy[];    //양1의 x,y좌표
float ss[], sdx[],sdy[];

float p;

float tx,ty,tc[],ts[],t;

float gx[];
float gy[];

int m;

void draw(){
  background(#00FF00);
  for(int m=0; m<100; m++){
    stroke(0);
    grass(gx[m],gy[m]);
    flower(gx[m],gy[m],random(256),random(256),random(256));
  }
  
  for(int m=1; m<100; m++){
    sheep(sx[m]+s*2,sy[m]-s*2,sdx[m]);
    textSize(ts[m]);
    fill(tc[m],0,0);
    text(m,sx[m],sy[m]);
    
    sx[m]+=ss[m]*sdx[m]*p;
    if(sx[m]+s*6>width || sx[m]-s*6<0){
      sdx[m]*=-1;
    }
    
    sy[m]+=ss[m]*0.1*sdy[m]*p;
    if(sy[m]+s*8>height || sy[m]-s*2<0){
      sdy[m]*=-1;
    }
    
    if(keyPressed && key=='s'){
      p=0;
    }
    if(keyPressed && key=='r'){
      p=1;
    }
    
    if(mousePressed && mouseX<sx[m]+s*10 && mouseX>sx[m]-s*10 && mouseY<sy[m]+s*6 && mouseY>sy[m]-s*6){
      ts[m]=30;
      tc[m]=255;
      sx[m]=mouseX;
      sy[m]=mouseY;
    }
    
    mysheep(); 
    if(keyPressed && key=='c'){
      t=1;
      ts[m]=15;
      tc[m]=0;
      ss[m]=random(2,8);
    }
    
    if(t==-1 && tc[m]==255){
      ss[m]=0;
      if(tx<sx[m] && sdx[m]==1 || tx>sx[m] && sdx[m]==-1){
        sdx[m]*=-1;
      }
      sx[m]+=(tx-sx[m])*0.02;
      sy[m]+=(ty-sy[m])*0.02;
    }
  }
}

void keyPressed(){
  if(key=='m'){
    tx=random(width-s*6);
    ty=random(height-s*6);
    t=-1;
  }
}

void mousePressed(){
  for(m=0; m<100; m++)
  if(ts[m]!=15 && tc[m]!=0){
    ts[m]=15;
    tc[m]=0;
    ss[m]=random(2,8);
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

void mysheep(){
  if(t==1){
  }else if(t==-1){
    textSize(30);
    fill(255,0,0);
    text("My Sheep",tx,ty);
  }
}

void sheep(float sx,float sy,float sd){
  if(sd==1){
    pushMatrix();
    translate(sx-s*4,sy);
    strokeWeight(7);
    stroke(#5A5A5A);    //다리색: 진회색
    line(-s, s*4,-s, s*8);    //다리그리기1
    line(s, s*4,s, s*8);    //다리그리기2
    popMatrix();
    
    pushMatrix();
    translate(sx+s*2,sy);
    strokeWeight(7);
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

    strokeWeight(7);    //귀굵기: 10
    stroke(#5A5A5A);    //귀색: 진회색
    noFill();    //귀 채우지 않기
    arc(sx-s, sy-s*3,s*2,s*2,radians(0),radians(90));    //왼쪽귀
    arc(sx+s*5,sy-s*3,s*2,s*2,radians(90),radians(180));    //오른쪽귀

    strokeWeight(5);    //눈 굵기: 5
    stroke(0);    //눈의 원 라인색: 검은색
    point(sx+s, sy-s);    //왼쪽눈
    point(sx+s*3, sy-s);    //오른쪽눈

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
    strokeWeight(7);
    stroke(#5A5A5A);    //다리색: 진회색
    line(-s, s*4,-s, s*8);    //다리그리기1
    line(s, s*4,s, s*8);    //다리그리기2
    popMatrix();
    
    pushMatrix();
    translate(sx+s*3,sy);
    strokeWeight(7);
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

    strokeWeight(7);    //귀굵기: 10
    stroke(#5A5A5A);    //귀색: 진회색
    noFill();    //귀 채우지 않기
    arc(sx-s*6, sy-s*3,s*2,s*2,radians(0),radians(90));    //왼쪽귀
    arc(sx,sy-s*3,s*2,s*2,radians(90),radians(180));    //오른쪽귀

    strokeWeight(5);    //눈 굵기: 5
    stroke(0);    //눈의 원 라인색: 검은색
    point(sx-s*4, sy-s);    //왼쪽눈
    point(sx-s*2, sy-s);    //오른쪽눈

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
