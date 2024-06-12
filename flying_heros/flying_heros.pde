void setup(){
  size(1200,600);
  
  //비 배열 선언
  rx=new float [100];
  ry=new float [100];
  
  rp=height/20;
  
  hp=height/60;
  
  batmanNumber=0;
  supermanNumber=0;
  
  part=1;
}

float rx[],ry[];    //비 배열
float rp;    //비 한 픽셀

float hp;    //Hero 한 픽셀

float bx[],by[];    //배트맨 배열
float bs[],bxd[],byd[];

float sx[],sy[];    //슈퍼맨 배열
float ss[],sxd[],syd[];

int batmanNumber;    //배트맨 개수: part1에 입력하는 수 저장
int supermanNumber;    //슈퍼맨 개수: part2에 입력하는 수 저장

int part;    //화면 단계

void draw(){
  background(100);
  for(int r=0;r<100;r++){
    rx[r]=random(width);
    ry[r]=random(height);
    rain(rx[r],ry[r]);
  }
  
  if(part==1){
    noStroke();
    fill(255,128);
    rect(width/2-300,height/2-150,600,300);
    fill(0);
    textSize(48);
    text("How many",width/2+25,height/2-15);
    text("batmans?",width/2+25,height/2+40);
    hero(width/2-150,height/2,-1,0,0);
  }else if(part==2){
    noStroke();
    fill(255,128);
    rect(width/2-300,height/2-150,600,300);
    fill(0);
    textSize(48);
    text("How many",width/2+25,height/2-15);
    text("supermans?",width/2+25,height/2+40);
    hero(width/2-150,height/2,1,#FF0000,#0000FF);
  }else if(part==0){
    for(int b=0; b<batmanNumber;b++){
      hero(bx[b],by[b],bxd[b],0,0);
      bx[b]+=bs[b]*bxd[b];
      by[b]+=bs[b]*byd[b];
      if(bx[b]<hp*5 || bx[b]>width-hp*5){
        pushMatrix();
        translate(bx[b],by[b]);
        for(int br=0; br<180; br++){
         rotate(radians(180-br));
        }
        popMatrix();
        bxd[b]*=-1;
      }
      if(by[b]<hp*4 || by[b]>height-hp*4){
        byd[b]*=-1;
      }
    }
    for(int s=0; s<supermanNumber;s++){
      hero(sx[s],sy[s],sxd[s],#FF0000,#0000FF);
      sx[s]+=ss[s]*sxd[s];
      sy[s]+=ss[s]*syd[s];
      if(sx[s]<hp*5 || sx[s]>width-hp*5){
        sxd[s]*=-1;
      }
      if(sy[s]<hp*4 || sy[s]>height-hp*4){
        syd[s]*=-1;
      }
    }
  }
}

void keyPressed(){
  if(key>='0' && key<='9'){
    if(part==1){
      batmanNumber=key-'0';
      part=2;
      bx=new float [batmanNumber];
      by=new float [batmanNumber];
      bs=new float [batmanNumber];
      bxd=new float [batmanNumber];
      byd=new float [batmanNumber];
      for(int b=0; b<batmanNumber;b++){
        bx[b]=random(hp*5,width-hp*5);
        by[b]=random(hp*4,height-hp*4);
        bs[b]=random(2,4);
        bxd[b]=-1;
        byd[b]=-1;
      }
    }else if(part==2){
      supermanNumber=key-'0';
      part=0;
      sx=new float [supermanNumber];
      sy=new float [supermanNumber];
      ss=new float [supermanNumber];
      sxd=new float [supermanNumber];
      syd=new float [supermanNumber];
      for(int s=0; s<supermanNumber;s++){
        sx[s]=random(hp*5,width-hp*5);
        sy[s]=random(hp*4,height-hp*4);
        ss[s]=random(2,4);
        sxd[s]=1;
        syd[s]=1;
      }
    }
  }
}

void rain(float x, float y){
  stroke(255);
  line(x+rp/2,y,x,y+rp*2);
}

void hero(float x, float y,float d, color c1, color c2){
  if(d==1){
    stroke(255);
    fill(c1);
    quad(x+hp*2,y+hp*2,x+hp*2,y-hp*2,x-hp*3,y-hp*4,x-hp*3,y+hp*4);
    fill(c2);
    triangle(x-hp*2,y,x-hp*2,y+hp,x-hp*5,y+hp/2);
    triangle(x-hp*2,y,x-hp*2,y-hp,x-hp*5,y-hp/2);
    quad(x-hp*2,y-hp,x-hp*2,y+hp,x+hp*2,y+hp*2,x+hp*2,y-hp*2);
    ellipse(x+hp*3+hp/2,y+hp*2,hp*3,hp);
    ellipse(x+hp-hp/2,y-hp*2,hp*3,hp);
    fill(#F7D6AC);
    ellipse(x+hp*3,y,hp*2,hp*2);
    fill(0);
    arc(x+hp*3,y,hp*2,hp*2,HALF_PI,PI+HALF_PI,OPEN);
  }else if(d==-1){
    stroke(255);
    fill(c1);
    quad(x-hp*2,y+hp*2,x-hp*2,y-hp*2,x+hp*3,y-hp*4,x+hp*3,y+hp*4);
    fill(c2);
    triangle(x+hp*2,y,x+hp*2,y+hp,x+hp*5,y+hp/2);
    triangle(x+hp*2,y,x+hp*2,y-hp,x+hp*5,y-hp/2);
    quad(x+hp*2,y-hp,x+hp*2,y+hp,x-hp*2,y+hp*2,x-hp*2,y-hp*2);
    ellipse(x-hp*4+hp/2,y+hp*2,hp*3,hp);
    ellipse(x-hp/2,y-hp*2,hp*3,hp);
    fill(#F7D6AC);
    ellipse(x-hp*3,y,hp*2,hp*2);
    fill(0);
    arc(x-hp*3,y,hp*2,hp*2,HALF_PI,PI+HALF_PI,OPEN);
  }
}
