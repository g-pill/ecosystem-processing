class Food {
  
  PVector position;
  float mass;
  
  Food(float m) {
    mass = m;
  }
  
  void display() {
    position = new PVector(mouseX, mouseY);
    fill(170, 50, 200, 35);
    noStroke();
    ellipseMode(CENTER);
    ellipse(position.x, position.y, 35, 35);
  }
 
  PVector attract(Bug b) {
    PVector force = PVector.sub(position, b.position);
    float distance = force.mag();
    distance = constrain(distance, 5.0, 18.0);
    float strength = (G * mass * b.mass) / (distance * distance);
    
    force.normalize();
    force.mult(strength);
    return force;
  }
}
    