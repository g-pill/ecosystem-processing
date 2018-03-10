class Predator {
  
  PVector position; 
  float mass;
  
  Predator(float m) {
    position = new PVector(random(width), random(height));
    mass = m;
  }
  
  void display() {
    stroke(90,90,90);
    strokeWeight(3);
    noFill();
    ellipseMode(CENTER);
    ellipse(position.x, position.y, 35, 35);
  }
  
  PVector scare(Bug b) {
    PVector force = PVector.sub(position, b.position);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 50.0);
    float strength = (G * mass * b.mass) / (distance * distance);
    
    force.normalize();
    if (distance > 10) force.mult(-5 * strength);
    else force.mult(-1 * strength);
    return force;
  } 
}