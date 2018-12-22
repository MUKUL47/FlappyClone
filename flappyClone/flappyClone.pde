PImage Bird , Background 
, Obstacle1T ,Obstacle2T, 
  Obstacle1B , Obstacle2B ;

boolean Fall=false;
float birdY = 230 , Y = 0 , X = 460  , X1 = 760, 
H1 = random(350,600) , H = 800-H1,  H1T = H ,
h1 = random(350,600) , h = 800-h1,  h1T = h 
;int Score = 0 , GlobalScore = 0;
boolean T1 = true,T2 = true;
void setup(){ 
size(450,500); 
Background=loadImage("Background.PNG"); 
Bird=loadImage("Bird.png"); 
Obstacle1T=loadImage("PipeB.PNG"); 
Obstacle1B=loadImage("PipeT.PNG"); 
Obstacle2T=loadImage("PipeB.PNG"); 
Obstacle2B=loadImage("PipeT.PNG"); 
}

void draw(){ 
loadImages(); 
jump(); 
moveObstacles(); 
gameOver();
text("Score : "+Score+"", width/2-70, 100);
textSize(32);
if( T1 && X<=120 ){
Score+=1; T1=false;
}
if( T2 && X1<=120 ){
Score+=1; T2=false;
}

text("Best :"+GlobalScore, 15,30);
}

void loadImages(){ background(0); image(Background,0,0); }

void jump(){
image(Bird,130,birdY,100,100);
if(key==' ' && keyPressed){ birdY-=4; Fall=false; } else { Fall=true; }
if(Fall) { Y+=.15; } else { Y=0; }
birdY+=Y; }                                                                                                                                                                                                    

void moveObstacles(){   
image(Obstacle1B,X--,H,50,H1); image(Obstacle1T,X--,-100,50,H1T); 
if(X<-100){ X = 460; H1 = random(350,600); H = 800-H1; H1T = H; T1 = true;}

image(Obstacle2B,X1--,h,50,h1); image(Obstacle2T,X1--,-100,50,h1T);
if(X1<-100){ X1 = 460;  h1 = random(350,600); h = 800-h1; h1T = h; T2 = true;}
}                                               

void gameOver(){ if( (abs(X-130)<5 && (H-(birdY+88)<0 || (birdY+150)-H1T<0)) || (abs(X1-130)<5 && (h-(birdY+88)<0 || (birdY+150)-h1T<0)) || birdY >= 415 ){  noLoop(); loop(); reset();} }
void reset() { 
  birdY = 230 ; Y = 0 ; X = 460  ; X1 = 760;  H1 = random(350,600) ; H = 800-H1;  H1T = H ; h1 = random(350,600) ; h = 800-h1;  h1T = h ; 
  if(GlobalScore<Score){ GlobalScore=Score; } Score = 0 ; T1 = T2 = true ; 
}
