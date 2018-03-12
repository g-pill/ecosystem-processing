//ECOSYSTEM PROJECT
//G. Pillai
//Feb 2018


Bug[] b = new Bug[20];
Food f;
Predator p;

float G = 1;

void setup() {
  size(800, 800);
  background(255);
  for (int i=0; i < b.length; i++) {
    b[i] = new Bug(random(4,12));
  }
  f = new Food(40);
  p = new Predator(35);
}

void draw() {
  fill(255, 10);
  rect(0, 0, width, height);
  smooth();
  
  p.display();
  p.update();
  p.checkEdges();
  f.display();
  
  for (int i=0; i < b.length; i++) {
    for (int j=0; j < b.length; j++) {
      if (i != j) {
        PVector force = b[j].repel(b[i]);
        b[i].applyForce(force);
      }
    }
    PVector fForce = f.attract(b[i]);
    b[i].applyForce(fForce);
    
    PVector pForce = p.scare(b[i]);
    b[i].applyForce(pForce);
    
    b[i].display();
    b[i].update();
    b[i].checkEdges();
  }
}