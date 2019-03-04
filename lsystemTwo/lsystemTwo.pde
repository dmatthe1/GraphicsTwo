String[] cMark = new String [12];

Web bottomSlinger;
Web topSlinger;
boolean pulsate;
boolean ascending;

int maxLevel = 11;
int minLevel = 0;
int count = 0;

int mainX = 0; //E
int mainY = 0; //E
int midX = 1; //M
int midY = 1; //M
//int lastX = 1; //T
//int lastY = 1; //T
int currentX = 0;
int currentY = 0;

void setup() {
  size(800,800);
  bottomSlinger = new Web(new PVector(width/2, height));
  topSlinger = new Web(new PVector(width/2, 0));
  pulsate = false;
  ascending = true;
  
  cMark[0] = "B";
  cMark[1] = "B-MB";
  cMark[2] = "[B-MBMB+B]ER-B";
  cMark[3] = "[B-MBMB+B]ER-B-MB";
  cMark[4] = "[B-MBMB+B]ER-[B-MBMB+B]";
  cMark[5] = "[B-MBMB+B]ER-[B-MBMB+B]ER-B";
  cMark[6] = "[B-MBMB+B]ER-[B-MBMB+B]ER-B-MB";//
  cMark[7] = "[B-MBMB+B]ER-[B-MBMB+B]ER-[B-MBMB+B]";
  cMark[8] = "[B-MBMB+B]ER-[B-MBMB+B]ER-[B-MBMB+B]ER-B";
  cMark[9] = "[B-MBMB+B]ER-[B-MBMB+B]ER-[B-MBMB+B]ER-B-MB";
  cMark[10] = "[B-MBMB+B]ER-[B-MBMB+B]ER-[B-MBMB+B]ER-[B-MBMB+B]";
  cMark[11] = "[B-MBMB+B]ER-[B-MBMB+B]ER-[B-MBMB+B]ER-[B-MBMB+B]ER-B";
  /*
  B: draw curve
  +: flip right 180 degrees
  -: flip left 180 degrees
  M: move origin to halfway point of lst bezier curve
  T: move origin to the end of the last bezier
  E: move origin to the end of the main curve
  */
}

int level = 0;
void draw(){
  background(0);
  
  //Web Systems
  bottomSlinger.run();
  topSlinger.run();
  
  //Pulsation
  text("Press 'p' to pulsate", 10, 15);
  
  if (pulsate) {
    count++; 
    if (count % 4 == 0) {
      if (ascending) {
        if (level < maxLevel) level++;
        else ascending = false;
      } else {
        if (level > minLevel) level--;
        else ascending = true;
      }   
    }
  }
  
  
  //Matrix
  translate(width/2, height/2);
  stroke(255);
  strokeWeight(3);
  
  pushMatrix();
  //makeCurve(0, 0);
  arcMark();
  popMatrix();
  
  rotate(radians(120));
  pushMatrix();
  arcMark();
  popMatrix();

  rotate(radians(120));
  pushMatrix();
  arcMark();
  popMatrix();
  
  
}

void arcMark(){
  for(int i = 0; i < cMark[level].length(); i++){
    char c = cMark[level].charAt(i);
    if(c == 'B') {
      //makeCurve(0, 0, 50);
      makeCurve(0, 0, 50);
    }
    else if (c == 'M') {
      currentX = midX;
      currentY = midY;
      translate(midX + -14, midY-18);
    }
    else if(c == 'E'){
      currentX = mainX;
      currentY = mainY;
      translate(mainX, mainY);
    }
    else if(c == 'R') rotate(radians(90));
    else if (c == '-') flipLeft();
    else if(c == '+') flipRight();
    else if (c == '[') pushMatrix();
    else if (c == ']') popMatrix();
  }
}


void flipLeft(){
  //translate arc
  //rotate(-angle);//Need to rotate around the y axis
  applyMatrix(-1, 0, 0, 0, 1, 0);
}

void flipRight(){
  //translate arc
  //rotate(angle);//Need to rotate around the y axis
  applyMatrix(-1, 0, 0, 0, 1, 0);
}

void makeCurve(int x, int y, int radius){
  //int angle = 90;
  //float l = 4 * tan(radians(angle/4))/3;
  noFill();
  bezier(x, y, x-2, y-radius, x + (radius/2), y-radius-2, x+radius, y-radius);
  
  
  if(currentX == mainX && currentY == mainY){
    //lastX = x+radius;
    //lastY = y-radius; 
    midX = x + (radius/4);
    midY = y - (radius/4);
    mainX = x+radius;
    mainY = y-radius;
  }
  else if(currentX == midX && currentY == midY){
    midX = x + (radius/4);
    midY = y - (radius/4);
    //lastX = x+radius;
    //lastY = y-radius;
  }
  
}

void keyPressed(){
  if(keyCode == LEFT || keyCode == DOWN){
    level--;
    if(level < 0) level = 0;
  }
  if(keyCode == RIGHT || keyCode == UP){
    level++;
    if(level > maxLevel) level = maxLevel;
  }
  
  if (key == 'p') pulsate = !pulsate;
}
