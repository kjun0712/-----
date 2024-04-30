void setup(){
  size(600,280);
  p=8;
  px=p*2.5; py=p*2.5;
  pdx=1;
}
float p;
float px,py,pdx;
float sx,sy;
float hx,hy;

void back(){
  background(0);
  for(int i=40;i<width;i+=p*5){
    stroke(255);
    line(i,0,i,height);
  }for(int t=40;t<height;t+=p*5){
    stroke(255);
    line(0,t,width,t);
  }
}

void pacman(float a,float b,float pp,float dx){
  if(dx==1){
    strokeWeight(1);
    noStroke();
    fill(#FFFF00);
    arc(a,b,pp*5,pp*5,radians(60),radians(360));
    stroke(255);
    fill(0);
    ellipse(a+pp,b-pp,pp,pp);
  }else if(dx==-1){
    strokeWeight(1);
    noStroke();
    fill(#FFFF00);
    arc(a,b,pp*5,pp*5,radians(180),radians(480));
    stroke(255);
    fill(0);
    ellipse(a-pp,b-pp,pp,pp);
  }
}
  
void star(float x,float y){
  noStroke();
  fill(#FFFF00);
  triangle(x,y+p,x+p*5,y+p,x+p*2+p/2,y+p*5);
  triangle(x,y+p*4,x+p*5,y+p*4,x+p*2+p/2,y);
}

void starb(){
  for(sx=p*5;sx<width;sx+=p*10){
    for(sy=0;sy<height;sy+=p*10){
      if(sx<px && px<sx+p*5 && sy<py &&py<sy+p*5){
        continue;
      }
      star(sx,sy);
    }
  }
  for(sx=0;sx<width;sx+=p*10){
    for(sy=p*5;sy<height;sy+=p*10){
      if(sx<px && px<sx+p*5 && sy<py &&py<sy+p*5){
        continue;
      }
      star(sx,sy);
    }
  }
}

void heart(float c,float d){
  noStroke();
  fill(#FF0000);
  arc(c+p*2+p/2,d+p*2+p/2,p*5,p*5,radians(0),radians(180));
  arc(c+p*1.25,d+p*2+p/2,p*2.5,p*2.5,radians(180),radians(360));
  arc(c+p*3.75,d+p*2+p/2,p*2.5,p*2.5,radians(180),radians(360));
}

void heartb(){
  for(hx=0;hx<width;hx+=p*10){
    for(hy=0;hy<height;hy+=p*10){
      if(hx<px && px<hx+p*5 && hy<py &&py<hy+p*5){
        continue;
      }
      heart(hx,hy);
    }
  }
  for(hx=p*5;hx<width;hx+=p*10){
    for(hy=p*5;hy<height;hy+=p*10){
      if(hx<px && px<hx+p*5 && hy<py &&py<hy+p*5){
        continue;
      }
      heart(hx,hy);
    }
  }
}
void draw(){
  px+=4*pdx;
  
  if(px>width || px<0){
    py+=p*5;
    pdx*=-1;
  }
  
  if(px>width && py>height){
      px=width-p*2.5;
      py=p*2.5;
      back();
      heartb();
  }else if(px<0 && py>height){
      px=p*2.5;
      py=p*2.5;
      back();
      starb();
  }else{
      back();
      starb();
      heartb();
  }
  pacman(px,py,p,pdx);
}
