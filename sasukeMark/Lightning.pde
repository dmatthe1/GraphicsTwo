class Lightning {
   PVector loc1;
   PVector loc2;
   PVector vel;
   PVector acc;
   float lifespan;
   
   Lightning(PVector l1, PVector l2) { 
     loc1 = l1.copy(); 
     loc2 = l2.copy();
     vel = new PVector(random(-2,2), random(-2,2));
     acc = new PVector(0,0);
     lifespan = 255;
   }
   
   void display() {
     stroke(0, 0, lifespan);
     line(loc1.x, loc1.y, loc2.x, loc2.y);
   }
   
   void addForce(PVector force) {
     acc.add(force);
   }
   
   void update() {
     vel.add(acc);
     loc1.add(vel);
     loc2.add(vel);
     lifespan--;
   }
   
   boolean isDead() {
    return lifespan < 0; 
   }
}
