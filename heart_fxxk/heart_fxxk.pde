void setup(){
  size(900,600);
  
  p=10;
  
  hx=new float[100];
  hy=new float[100];
  
  r=new float[100];
  g=new float[100];
  b=new float[100];
  
  for(int i=0;i<100;i++){
    hx[i]=random(p*3,width-p*3);
    hy[i]=random(p*3,height-p*3);
    r[i]=255;
    g[i]=0;
    b[i]=0;
  }
  
  cr=1;
  
  eventStartTime=1000;
}

float hx[],hy[];
float p;

float r[],g[],b[];

int myheart;

int cr;

int eventStartTime=0;
int currentTime=millis();

void draw(){
  background(255);
  for(int i=0;i<100;i++){
    heart(hx[i],hy[i],color(r[i],g[i],b[i]));
    fill(255);
    text(i+1,hx[i]-p*0.5,hy[i]+p);
    
    if(mouseX>hx[myheart]-p*3 && mouseX<hx[myheart]+p*3 && mouseY>hy[myheart]-p*1.5 && mouseY<hy[myheart]+p*3){
      if(mousePressed==true){
        hx[myheart]=mouseX;
        hy[myheart]=mouseY;
      }
    }
    
    currentTime=millis();
    if(cr==0 && (currentTime-eventStartTime)>=1000){
      for(int t=0; t<100; t++){
        r[t]=random(256);
        g[t]=random(256);
        b[t]=random(256);
      }
      eventStartTime=currentTime;
    }
  }
}

void mousePressed(){
  for(int i=0;i<100;i++){
    if(mouseX>hx[i]-p*3 && mouseX<hx[i]+p*3 && mouseY>hy[i]-p*1.5 && mouseY<hy[i]+p*3){
      myheart=i;
      r[myheart]=random(256);
      g[myheart]=random(256);
      b[myheart]=random(256);
    }
  }
}

void keyPressed(){
  if(key=='r'){
    for(int i=0;i<100;i++){
      hx[i]=random(p*3,width-p*3);
      hy[i]=random(p*3,height-p*3);
      r[i]=255;
      g[i]=0;
      b[i]=0;
    }
    cr=1;
  }
  
  if(key=='t'){
    cr=0;
  }
}

void heart(float x, float y,color c){
  noStroke();
  fill(c);
  triangle(x-p*3,y,x+p*3,y,x,y+p*3);
  arc(x-p*1.5,y,p*3,p*3,radians(180),radians(360));
  arc(x+p*1.5,y,p*3,p*3,radians(180),radians(360));
}
