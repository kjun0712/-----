size(800,800);
int py=height/3;    //지평선위치설정

int g=height/120;    //잔디 모눈 한칸값
int s=height/80;    //양 모눈 한칸값

int sx=width/2;    //양의 x좌표
int sy=height*3/4;    //양의 y좌표

background(#81E3FF);    //하늘색 설정
fill(#24AA00);    //땅색: 초록색
rect(0,py,width,height-py);    //땅그리기

if(width>height){    //가로가 더 긴경우
  for(int i=0; i<width; i+=g*5){    //꽃 생성 반복문 가로줄
    for(int t=py; t<height; t+=g*5){    //꽃 생성 반복문 세로줄
      if(t<sy+g*20){    //양과 겹치는 꽃 범위설정
        if(t>sy-g*15){    //양과 겹치는 꽃 범위설정의 중첩
          continue;    //양과 겹치는 라인 꽃 미생성
        }
      }
      
      fill(#24AA00);    //잔디색: 초록색
      triangle(i+g,t,i+g*3,t,i+g*2,t-g*4);    //잔디그리기1
      triangle(i,t,i+g*5,t,i+g,t-g*3);    //잔디그리기2
      triangle(i+g,t,i+g*2,t,i+g,t-g*3);    //잔디그리기3
      
      fill(#FF64DB);    //꽃잎색: 분홍색
      ellipse(i+g*2,t-g*4,g*3,g*3);    //꽃잎 그리기
      fill(#C14CA6);    //꽃중앙색: 진한분홍색
      ellipse(i+g*2,t-g*4,g,g);   //꽃중앙 그리기
    }
  }   
  
  
}else if(width<height){    //세로가 더 긴경우
  for(int i=0; i<width; i+=g*5){    //꽃 생성 반복문 가로줄
    for(int t=py; t<height; t+=g*5){    //꽃 생성 반복문 세로줄
      if(t<sy+g*20){    //양과 겹치는 꽃 범위설정
        if(t>sy-g*15){    //양과 겹치는 꽃 범위설정의 중첩
          continue;    //양과 겹치는 라인 꽃 미생성
        }
      }
      
      fill(#24AA00);    //잔디색: 초록색
      triangle(i+g,t,i+g*3,t,i+g*2,t-g*4);    //잔디그리기1
      triangle(i,t,i+g*5,t,i+g,t-g*3);    //잔디그리기2
      triangle(i+g,t,i+g*2,t,i+g,t-g*3);    //잔디그리기3
      
      fill(#FF64DB);    //꽃잎색: 분홍색
      ellipse(i+g*2,t-g*4,g*3,g*3);    //꽃잎 그리기
      fill(#C14CA6);    //꽃중앙색: 진한분홍색
      ellipse(i+g*2,t-g*4,g,g);   //꽃중앙 그리기
      
    }
  }    
}else{    //가로, 세로 같은 경우
  for(int i=0; i<width; i+=g*5){
    for(int t=py; t<height; t+=g*5){
      if(i<sx+g*10){    //양과 겹치는 잔디 범위설정-가로
         if(i>sx-g*15){    //양과 겹치는 잔디 범위설정 충첩-가로
            if(t<sy+g*20){    //양과 겹치는 잔디 범위설정-세로
               if(t>sy-g*15){    //양과 겹치는 잔디 범위설정 중첩-세로
                 continue;    //양과 겹치는 부분 잔디 미생성
               }
             }
           }
         }
      fill(#24AA00);    //잔디색: 초록색
      triangle(i+g,t,i+g*3,t,i+g*2,t-g*4);    //잔디그리기1
      triangle(i,t,i+g*5,t,i+g,t-g*3);    //잔디그리기2
      triangle(i+g,t,i+g*2,t,i+g,t-g*3);    //잔디그리기3
    }
  }    
}

//양 그리기
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
stroke(255);    //머리털의 원 라인색: 검은색
ellipse(sx-s*3, sy-s*9/2, s*4,s*3);    //머리털그리기1
ellipse(sx-s, sy-s*7/2, s*2,s*2);    //머리털그리기2
ellipse(sx-s*5, sy-s*7/2, s*2,s*2);    //머리털그리기3
