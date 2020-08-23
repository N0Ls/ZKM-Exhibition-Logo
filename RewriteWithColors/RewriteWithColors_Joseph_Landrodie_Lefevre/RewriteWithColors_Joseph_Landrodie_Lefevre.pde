import processing.sound.*;

//Init variables
PFont myFont;
SinOsc sine;

  float x1 = width/4;
  float y1 = height/4;
  int direction_x1 = random_direction();
  int direction_y1 = random_direction();
      
  float x2 = 980;
  float y2 = 320;

  int direction_x2 = random_direction();
  int direction_y2 = random_direction();
      
  float x3 = 990;
  float y3 = 560;
  int direction_x3 = random_direction();
  int direction_y3 = random_direction();
      
  float x4 = 320;
  float y4 = 560;
  int direction_x4 = random_direction();
  int direction_y4 = random_direction();

void setup (){
  //Setup Canvas
  fullScreen(P3D);
  background(255);
 
  //Color Mode 
  colorMode(HSB,360,100,100);
 
  //Reset fill and stroke
  fill(0);
  noStroke();

  //Font setup
  myFont = createFont("ocr-aregular.ttf", 36);
 
  //Create the sine oscillator.
  sine = new SinOsc(this);
  sine.play();
}


void draw (){
    //BG color
    background(0,0,100);
    
    //Sound modification
    sine.freq(map(mouseY,0,height, 200,height));
    sine.pan(map(mouseX, 0, width, -1.0, 1.0));
    
    //Resetting shapes modes
    shapeMode(CENTER);
    rectMode(CENTER);
    
    //AutoMove 1
    x1=newX(x1,direction_x1);
    y1=newY(y1,direction_y1);
    
    if(x1 >= width/2 || x1<=0){
      direction_x1=-direction_x1; x1=newX(x1,direction_x1);
      direction_y1=random_direction(); y1=newY(y1,direction_y1);
    }
    if(y1 >= height/2 || y1<0){
      direction_x1=random_direction(); x1=newX(x1,direction_x1);
      direction_y1=-direction_y1; y1=newY(y1,direction_y1);
    }
      
    //AutoMove 2
    x2=newX(x2,direction_x2);
    y2=newY(y2,direction_y2);
    
    if(x2 >= width || x2<width/2){
      direction_x2=-direction_x2; x2=newX(x2,direction_x2);
      direction_y2=random_direction(); y2=newY(y2,direction_y2);
    }
    if(y2 >= height/2 || y2<0){
      direction_x2=random_direction(); x2=newX(x2,direction_x2);
      direction_y2=-direction_y2; y2=newY(y2,direction_y2);
    }
      
    //Automove 3 
    x3=newX(x3,direction_x3);
    y3=newY(y3,direction_y3);
    
    if(x3 >= width || x3 < width/2){
      direction_x3=-direction_x3; x3=newX(x3,direction_x3);
      direction_y3=random_direction(); y3=newY(y3,direction_y3);
    }
    if(y3 <= height/2 || y3 > height){
      direction_x3=random_direction(); x3=newX(x3,direction_x3);
      direction_y3=-direction_y3; y3=newY(y3,direction_y3);
    }
      
    //Automove 4
    x4=newX(x4,direction_x4);
    y4=newY(y4,direction_y4);
    
    if(x4 <0 || x4 >= width/2){
      direction_x4=-direction_x4; x4=newX(x4,direction_x4);
      direction_y4=random_direction(); y4=newY(y4,direction_y4);
    }
    if(y4 <= height/2 || y4 > height){
      direction_x4=random_direction(); x4=newX(x4,direction_x4);
      direction_y4=-direction_y4; y4=newY(y4,direction_y4);
    }
      
    //Upper left quad
    //Shapes are two triangles
    
    beginShape(TRIANGLES);
    
    fill(0,0,100); vertex(width/2, height/2); //Center point (white)
    fill(120,100,100);vertex(width/2, height/2-150); //Above center (green)
    
    //Moving point
    fill(56,100,100); //Yellow
    if(mouseX > 0 && mouseX <width/2 && mouseY > 0 && mouseY < height/2){ 
      vertex(mouseX, mouseY); 
      x1=mouseX; 
      y1=mouseY; 
      direction_x1=random_direction(); 
      direction_y1=random_direction();
    }
    else {
      vertex(x1,y1);
    }
    endShape();
    
    beginShape(TRIANGLES);
    fill(0,0,100);vertex(width/2, height/2);
    fill(39,100,100); vertex(width/2-150, height/2);
    fill(56,100,100);
    if(mouseX > 0 && mouseX <width/2 && mouseY > 0 && mouseY < height/2) {
      vertex(mouseX, mouseY);
    }
    else {
      vertex(x1,y1);
    }
    endShape();
      
      
    //Lower left quad
    beginShape(TRIANGLES);
    fill(0,0,100);vertex(width/2, height/2);
    fill(120,100,100);vertex(width/2, height/2-150);
    fill(150,100,100);
    if(mouseX > width/2 && mouseY > 0 && mouseY < height/2){ 
      vertex(mouseX, mouseY); 
      x2=mouseX; 
      y2=mouseY; 
      direction_x2=random_direction(); 
      direction_y2=random_direction();
    }
    else {
      vertex(x2,y2);
    }
    endShape();
    
    beginShape(TRIANGLES);
    fill(0,0,100);vertex(width/2, height/2);
    fill(180,100,100);vertex(width/2+150, height/2);
    fill(150,100,100);
    if(mouseX > width/2 && mouseY > 0 && mouseY < height/2) vertex(mouseX, mouseY);
    else {
      vertex(x2,y2);
    }
    endShape();
      
    //Lower right quad 
    beginShape(TRIANGLES);
    fill(0,0,100);vertex(width/2, height/2);
    fill(282,100,100);vertex(width/2, height/2+150);
    fill(240,100,100);
    if(mouseX > width/2 &&  mouseY > height/2){ 
      vertex(mouseX, mouseY); 
      x3=mouseX; 
      y3=mouseY; 
      direction_x3=random_direction(); 
      direction_y3=random_direction();
    }
    else {
      vertex(x3,y3);
    }
    endShape();
    
    beginShape(TRIANGLES);
    fill(0,0,100);vertex(width/2, height/2);
    fill(180,100,100);vertex(width/2+150, height/2);
    fill(240,100,100);
    if(mouseX > width/2 &&  mouseY > height/2) vertex(mouseX, mouseY);
    else {
      vertex(x3,y3);
    }
    endShape();
      
    //Upper left quad
    beginShape(TRIANGLES);
    fill(0,0,100);vertex(width/2, height/2);
    fill(282,100,100);vertex(width/2, height/2+150);
    fill(0,100,100);
    if(mouseX < width/2 &&  mouseY > height/2){
      vertex(mouseX, mouseY);
      x4=mouseX; 
      y4=mouseY; 
      direction_x4=random_direction(); 
      direction_y4=random_direction();
    }
    else {
      vertex(x4,y4);
    }
    endShape();
      
    beginShape(TRIANGLES);
    fill(0,0,100);vertex(width/2, height/2);
    fill(39,100,100);vertex(width/2-150, height/2);
    fill(0,100,100);
    if(mouseX < width/2 &&  mouseY > height/2) vertex(mouseX, mouseY);
    else {
      vertex(x4,y4);
    }
    endShape();
      
    //Text
    fill(0,0,0,190);
    textFont(myFont);
    textAlign(CENTER, CENTER);
    textLeading(35);
    text("WRITING \nTHE HISTORY \nOF THE \nFUTURE", width/2, height/2);
      
}



//Functions
float newX(float x,int direction_x){
  x+=direction_x;
  return x;
}

float newY(float y,int direction_y){
  y+=direction_y;
  return y;
}

int random_direction(){
  return (int) random(-5,5);
}
