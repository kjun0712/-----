void setup(){
  size(1200,800);
  bx=new float [100];
  bmx=new float [100];
  by=new float [100];
  
  bs=new float [100];
  ba=new float [100];
  bd=new float [100];
  
  r=new float[100];
  g=new float[100];
  b=new float[100];
  
  tc=new color[100];
  ts=new float[100];
  
  for(int i=0; i<100; i++){
    bx[i]=random(width);
    by[i]=random(height-50,height);
    
    bs[i]=0;
    bd[i]=1;
    
    r[i]=random(256);
    g[i]=random(256);
    b[i]=random(256);
    
    tc[i]=0;
    ts[i]=10;
  }
  
  s=-1;
  k=0;
  f=0;
}

float bx[],bmx[],by[];
float bs[],ba[],bd[];

float r[],g[],b[];

color tc[];
float ts[];

int mine,s;

char k;
int f;

void draw(){
  background(255);
  for(int i=0; i<100; i++){
    fly(bmx[i],by[i],5,color(r[i],g[i],b[i]));
    fill(tc[i]);
    textSize(ts[i]);
    text(i+1,bmx[i]-5,by[i]);
    
    by[i]-=bs[i]*bd[i];
    
    ba[i]+=bs[i]*0.02;
    bmx[i]=bx[i]-sin(ba[i])*20; 
    if(by[i]-25<0){
      bd[i]=0;
      f++;
    }
  }
  
  fill(255,0,0);
  textSize(20);
  text("key pressd: false / key:   / selected:__/ #of finished:",width/2-200, height/2);
  text(k,width/2-15, height/2);
  text(f,width/2+225, height/2);
  text(s,width/2+85, height/2);
}

void mousePressed(){
  for(int i=0;i<100;i++){
    tc[i]=0;
    ts[i]=10;
    if(mouseX>bmx[i]-5*5 && mouseX<bmx[i]+5*5 && mouseY>by[i]-5*2.5 && mouseY<by[i]+5*2.5){
      mine=i;
      tc[mine]=#FF0000;
      ts[mine]=20;
      s=mine+1;
    }
  }
}

void keyPressed(){
  if(key=='s'){
    for(int i=0; i<100; i++){
      bs[i]=random(1,3);
      bd[i]=1;
      k='s';
    }
  }else if(key=='b'){
    for(int i=0; i<100; i++){
      bx[i]=random(width);
      by[i]=random(height-50,height);
      bs[i]=0;
      k='b';
      f=0;
      tc[i]=0;
      ts[i]=10;
      s=-1;
    }
  }else if(key=='x'){
    for(int i=0; i<100; i++){
      bs[i]=0;
      k='x';
    }
  }
}

void fly(float x, float y, float p,color c){
  fill(c,128);
  ellipse(x,y,p*5,p*10);
  triangle(x,y+p*5,x-p*1.5,y+p*6,x+p*1.5,y+p*6);
  line(x,y+p*6,x,y+p*10);
}
