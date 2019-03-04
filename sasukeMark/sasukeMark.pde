String[] lsystem = new String [15];
Chidori chakra;
boolean pulsate;
boolean ascending;

int maxLevel = 14;
int minLevel = 0;
int count = 0;

void setup() {
  size(800,800);
  chakra = new Chidori(new PVector(width/2, -200));
  lsystem [0] = "M";
  lsystem[1] =  "MT[rMAtM]";
  lsystem[2] =  "MT[rMAtM]DDDM";
  lsystem[3] =  "MT[rMAtM]DDDM[rMAtM]";
  lsystem[4] =  "MT[rMAtM]DDDM[rMAtM]DDDM";
  lsystem[5] =  "MT[rMAtM]DDDM[rMAtM]DDDM[rMAtM]";
  lsystem[6] =  "MT[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM";
  lsystem[7] =  "MT[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]";
  lsystem[8] =  "MT[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM";
  lsystem[9] =  "MT[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]";
  lsystem[10] =  "MT[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM";
  lsystem[11] =  "MT[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]";
  lsystem[12] =  "MT[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM";
  lsystem[13] =  "MT[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]";
  lsystem[14] =  "MT[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM[rMAtM]DDDM";
  pulsate = false;
  ascending = true;
}

int level = 0;
void draw() {
  //Canvas Coloring
  background(0);
  stroke(0);
  strokeWeight(3);
  fill(0);
  chakra.run();
    
 if (pulsate) {
    count++;
    if (ascending)fill(194, 24, 7);
    if (count % 2 == 0) {
      if (ascending) {
        if (level < maxLevel) {
          level++;
        }
        else ascending = false;
      } else {
        if (level > minLevel){
          level--;
          fill(255);
        }
        else ascending = true;
      }   
    }
  }  
  
  ellipse (width/2, 350, 50, 50);
  ellipse (450, 450, 50, 50);
  ellipse (350, 450, 50, 50);
  text("Level: " + level, 10, 20);
   
  translate(width/2, height/2);
  //Center

  
  pushMatrix();
  translate(33, -67);
  applyMatrix(-1, 0, 0, 0, 1, 0);
  rotate(radians(180));
  curseMark();
  popMatrix();
  
  rotate(radians(120));
  pushMatrix();
  translate(55, -76);
  applyMatrix(-1, 0, 0, 0, 1, 0);
  rotate(radians(167));
  curseMark();
  popMatrix();
  
  rotate(radians(120));
  pushMatrix();
  translate(14, -85);
  applyMatrix(-1, 0, 0, 0, 1, 0);
  rotate(radians(180));
  curseMark();
  popMatrix();

}

void curseMark(){
  for(int i = 0; i < lsystem[level].length(); i++){
    char c = lsystem[level].charAt(i);
    if(c == 'M') makeMark(0, 0);
    else if (c == 'D') translate(10, 10);
    else if(c == 'T') translate(0, -10);
    else if (c== 't') translate(65, 5);
    else if(c == 'r') rotate(radians(-30));
    else if (c == 'A') applyMatrix(-1, 0, 0, 0, 1, 0);
    else if(c == '[') pushMatrix();
    else if(c == ']') popMatrix();
  }
}

void makeMark(int x, int y){
   arc(x, y, 96, 24, 1, PI+QUARTER_PI, OPEN);
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
