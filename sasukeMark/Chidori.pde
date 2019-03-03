class Chidori {
  PVector origin;
  ArrayList<Lightning> parts;
  PVector lastPoint;
  
  Chidori(PVector o) {
   origin = o.copy();
   lastPoint = o.copy();
   parts = new ArrayList<Lightning>();  
  }
  
  void addForce(PVector force) {
    for (Lightning p: parts) p.addForce(force);
  }
  
  void run() {
   for(int i = 0; i < parts.size(); i++) {
     Lightning p = parts.get(i);
     if (p.isDead()) parts.remove(i);
     p.display();
     p.update();
   }
   
   addParticle();
   addParticle();
   addParticle();
  }
  
  void addParticle() {
   PVector randLight = new PVector(origin.x + random(-30,30), origin.y + random(-30,30));
   parts.add(new Lightning(lastPoint, randLight)); 
   lastPoint = randLight.copy();
  }
}
