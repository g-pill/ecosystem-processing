class Food {
  
  PVector position;
  float mass;
  
  Food(float m) {
    mass = m;
  }
  
  void display() {
    position = new PVector(mouseX, mouseY);
    noFill();
    stroke(80);
    strokeWeight(1);
    ellipseMode(CENTER);
    ellipse(position.x, position.y, 50, 50);
  }
 
  PVector attract(Bug b) {
    PVector force = PVector.sub(position, b.position);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 20.0);
    float strength = (G * mass * b.mass) / (distance * distance);
    
    force.normalize();
    force.mult(strength);
    return force;
  }
}
    