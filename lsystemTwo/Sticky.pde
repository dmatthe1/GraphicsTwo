class Sticky {
   PVector loc;
   PVector vel;
   PVector acc;
   float lifespan;
   
   Sticky(PVector l) { 
     loc = l.copy(); 
     vel = new PVector(random(-2,2), random(-2,2));
     acc = new PVector(0,0);
     lifespan = 255;
   }
   
   void display() {
     noStroke();
     fill(lifespan, lifespan, lifespan);
     
     //eyes
     ellipse(loc.x - 5, loc.y - 3, 3, 3);
     ellipse(loc.x + 5, loc.y - 3, 3, 3);
     ellipse(loc.x - 4, loc.y - 4, 3, 3);
     ellipse(loc.x + 4, loc.y - 4, 3, 3);
     ellipse(loc.x - 3, loc.y - 5, 3, 3);
     ellipse(loc.x + 3, loc.y - 5, 3, 3);
     
     //body
     ellipse(loc.x, loc.y, 10, 10); 
     
     
     //legs
     stroke(lifespan);
     line(loc.x, loc.y, loc.x - 10, loc.y - 8);
     line(loc.x, loc.y, loc.x - 10, loc.y - 4);
     line(loc.x, loc.y, loc.x - 10, loc.y);
     line(loc.x, loc.y, loc.x - 10, loc.y + 4);
     
     line(loc.x, loc.y, loc.x + 10, loc.y - 8);
     line(loc.x, loc.y, loc.x + 10, loc.y - 4);
     line(loc.x, loc.y, loc.x + 10, loc.y);
     line(loc.x, loc.y, loc.x + 10, loc.y + 4);
   }
   
   void addForce(PVector force) {
     acc.add(force);
   }
   
   void update() {
     vel.add(acc);
     loc.add(vel);
     lifespan--;
   }
   
   boolean isDead() {
    return lifespan < 0; 
   }
}
