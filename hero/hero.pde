void setup(){
  size(1200,600);
  rn = height/20;
  h = height/60;
  sx = h*5; sy = height/2; ss = 2;
  sdx = 1; sdy = 1;
  bx = width-h*5; by = height/2; bs = 4;
  bdx = -1; bdy = -1;
}
int sx,sy,ss;
int sdx,sdy;
int bx,by,bs;
int bdx,bdy;
int rn;
int h;
int i, t;

void rain(int rp){
  stroke(255);
  line(i+rp/2,t,i,t+rp*2);
}

void rain_background(){
  background(100);
  for(i=0;i<width;i+=rn*2){
    for(t=0;t<height;t+=rn*2){
      rain(rn);
    }
  }
  for(i=rn;i<width;i+=rn*2){
    for(t=rn;t<height;t+=rn*2){
      rain(rn);
    }
  }
}

void hero(int x, int y,int d, int hp, color c1, color c2){
  if(d==1){
    stroke(255);
    fill(c1);
    quad(x+hp*2,y+hp*2,x+hp*2,y-hp*2,x-hp*3,y-hp*4,x-hp*3,y+hp*4);
    fill(c2);
    triangle(x-hp*2,y,x-hp*2,y+hp,x-h*5,y+hp/2);
    triangle(x-hp*2,y,x-hp*2,y-hp,x-h*5,y-hp/2);
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
    triangle(x+hp*2,y,x+hp*2,y+hp,x+h*5,y+hp/2);
    triangle(x+hp*2,y,x+hp*2,y-hp,x+h*5,y-hp/2);
    quad(x+hp*2,y-hp,x+hp*2,y+hp,x-hp*2,y+hp*2,x-hp*2,y-hp*2);
    ellipse(x-hp*4+hp/2,y+hp*2,hp*3,hp);
    ellipse(x-hp/2,y-hp*2,hp*3,hp);
    fill(#F7D6AC);
    ellipse(x-hp*3,y,hp*2,hp*2);
    fill(0);
    arc(x-hp*3,y,hp*2,hp*2,HALF_PI,PI+HALF_PI,OPEN);
  }
}

void draw(){
  rain_background();
  sx=sx+ss*sdx;
  sy=sy+ss*2*sdy;
  hero(sx,sy,sdx,h,#FF0000,#0000FF);
  if(sx+h*5>width || sx-h*5<0){
    sdx=-sdx;
  }if(sy+h*4>height || sy-h*4<0){
    sdy=-sdy;
  }
  
  bx=bx+bs*bdx;
  by=by+bs/2*bdy;
  hero(bx,by,bdx,h,0,0);
  if(bx+h*5>width || bx-h*5<0){
    bdx=-bdx;
  }if(by+h*4>height || by-h*4<0){
    bdy=-bdy;
  }
  
  if(sdx==bdx && sx-h*5<=bx+h*5 && sy-h<=by && by<=sy+h){
    sdx=-sdx;
    sdy=-sdy;
    bdx=-bdx;
    bdy=-bdy;
  }
}
