String[] lsystem = new String [5];
String[] cMark = new String [5];
int angle = 36;
int mainX = 0; //E
int mainY = 0; //E
int midX = 0; //M
int midY = 0; //M
int lastX = 0; //T
int lastY = 0; //T

void setup() {
  size(800,800);
  cMark[0] = "B";
  cMark[1] = "B-MB";
  cMark[2] = "B-MBTB+BE-B";
  cMark[3] = "B-MBTB+BE-B-MB";
  cMark[4] = "B-MBTB+BE-B-MB";
  /*
  B: draw curve
  +: flip right 180 degrees
  -: flip left 180 degrees
  M: move origin to halfway point of lst bezier curve
  T: move origin to the end of the last bezier
  E: move origin to the end of the main curve
  */
  /*
  cMark[0] = "FX";
  cMark[1] = "FX+YF";
  cMark[2] = "FX+YF+FX-YF";
  cMark[3] = "FX+YF+FX-YF+FX+YF-FX-YF";
  cMark[4] = "FX+YF+FX-YF+FX+YF-FX-YF+FX+YF+FX-YF-FX+YF-FX-YF";
  */
}

int level = 0;
void draw(){
  background(0);

  translate(width/2, height/2);
  stroke(255);
  strokeWeight(3);
  //arc(0, 0, 50, 50, 0, HALF_PI);
  //noFill();
  
  pushMatrix();
  //makeCurve(0, 0);
  arcMark();
  popMatrix();
  
}

void arcMark(){
  for(int i = 0; i < cMark[level].length(); i++){
    char c = cMark[level].charAt(i);
    if(c == 'B') makeCurve(0, 0, 50);
    else if (c == '-') flipLeft(radians(180));
    else if(c == '+') flipRight(radians(180));
    //flipLeft(radians(180));
  }
}

void flipLeft(float angle){
  //translate arc
  rotate(-angle);
}

void flipRight(float angle){
  //translate arc
  rotate(angle);
}

void makeCurve(int x, int y, int radius){
  //int angle = 90;
  //float l = 4 * tan(radians(angle/4))/3;
  noFill();
  bezier(x, y, x-2, y-radius, x + (radius/2), y-radius-2, x+radius, y-radius);

  lastX = x+radius;
  lastY = y-radius; 
  midX = x + (radius/4);
  midY = y - (radius/4);
}

void keyPressed(){
  if(keyCode == LEFT || keyCode == DOWN){
    level--;
    if(level < 0) level = 0;
  }
  if(keyCode == RIGHT || keyCode == UP){
    level++;
    if(level > 4) level = 4;
  }
}

/*
void f (float len){
  //line(0, 0, 0, -len);
  //arc(50, 55, 50, 50, 0, HALF_PI);
  arc(0, 0, len, len, 0, HALF_PI);
  noFill();
  translate(50, 20);
}
*/
