String[] lsystem = new String [5];
Chidori chakra;

void setup() {
  size(800,800);
  filter(BLUR ,3);
  chakra = new Chidori(new PVector(width/2, height/2));
}

int level = 0;
void draw() {
  //Canvas Coloring
  background(255);
  stroke(0);
  strokeWeight(3);
  fill(0);
  
  //Center
  ellipse (width/2, 350, 50, 50);
  ellipse (450, 450, 50, 50);
  ellipse (350, 450, 50, 50);
  
  text("Level: " + level, 10, 20);
  
  //chakra.run();
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
