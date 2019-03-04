class Lightning {
   PVector loc;
   PVector vel;
   PVector acc;
   float lifespan;
   
   Lightning(PVector l) { 
     loc = l.copy(); 
     vel = new PVector(random(-2,2), random(0,4));
     acc = new PVector(0,0);
     lifespan = 255;
   }
   
   void display() {
     noStroke();
     fill(lifespan, lifespan, 255);
     beginShape();
     vertex(loc.x, loc.y);
     vertex(loc.x + 20, loc.y);
     vertex(loc.x + 10, loc.y + 20);
     vertex(loc.x + 15, loc.y + 30);
     vertex(loc.x + 5, loc.y + 50);
     vertex(loc.x + 5, loc.y + 30);
     vertex(loc.x - 5, loc.y + 20);   
     endShape(CLOSE);
   }
   
   void addForce(PVector force) {
     acc.add(force);
   }
   
   void update() {
     vel.add(acc);
     loc.add(vel);
     if (lifespan > 0) lifespan -= 0.5;
   }
   
   boolean isDead() {
    return (loc.y > height); 
   }
}
