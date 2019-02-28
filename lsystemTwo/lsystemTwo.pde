String[] lsystem = new String [5];
String[] cMark = new String [5];
int angle = 36;

void setup() {
  size(800,800);
  /*
  lsystem[0] = "[7]++[7]++[7]++[7]++[7]";
  lsystem[1] = "81++91----71[-81----61]++";
  lsystem[2] = "+81--91[---61--71]+";
  lsystem[3] = "-61++71[+++81++91]-";
  lsystem[4] = "--81++++61[+91++++71]--71";
  */
  cMark[0] = "FX";
  cMark[1] = "FX+YF";
  cMark[2] = "FX+YF+FX-YF";
  cMark[3] = "FX+YF+FX-YF+FX+YF-FX-YF";
  cMark[4] = "FX+YF+FX-YF+FX+YF-FX-YF+FX+YF+FX-YF-FX+YF-FX-YF";
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
  arcMark();
  popMatrix();
  
}

void arcMark(){
  for(int i = 0; i < cMark[level].length(); i++){
    char c = cMark[level].charAt(i);
    if(c == 'F') f(50);
    else if (c == '-') flipLeft(PI/3);
    else if(c == '+') flipRight(radians(180));
    //flipLeft(radians(180));
  }
}

void f (float len){
  //line(0, 0, 0, -len);
  //arc(50, 55, 50, 50, 0, HALF_PI);
  arc(0, 0, len, len, 0, HALF_PI);
  noFill();
  translate(30, 20);
}

void flipLeft(float angle){
  //translate arc
  rotate(-angle);
}

void flipRight(float angle){
  //translate arc
  rotate(angle);
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
