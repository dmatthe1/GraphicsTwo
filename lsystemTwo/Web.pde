class Web {
  PVector origin;
  ArrayList<Sticky> parts;
  
  Web(PVector o) {
   origin = o.copy();
   parts = new ArrayList<Sticky>();
  }
  
  void addForce(PVector force) {
    for (Sticky p: parts) p.addForce(force);
  }
  
  void run() {
   for(int i = 0; i < parts.size(); i++) {
     Sticky p = parts.get(i);
     if (p.isDead()) parts.remove(i);
     p.display();
     p.update();
   }
   
   addParticle();
  }
  
  void addParticle() {
   parts.add(new Sticky(origin)); 
  }
}
