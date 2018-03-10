class Bug {
  
  PVector position;
  PVector velocity;
  PVector acceleration;
  float mass;
  float topspeed = 3;
  
  Bug(float m) {
    position = new PVector(random(width), random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = m;
  }
  
  void display() {
    stroke(0);
    fill(0);
    ellipse(position.x, position.y, 10, 10);
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(topspeed);
    position.add(velocity);
    
    float z = random(1);
    if (z > 0.95) {
      acceleration = PVector.random2D();
      acceleration.normalize();
      acceleration.mult(random(-0.6, 0.6));
    }
  }
  
  PVector repel(Bug b) {
    PVector force = PVector.sub(position, b.position);
    float distance = force.mag();
    distance = constrain(distance, 0.1, 50.0);
    float strength = (G * mass * b.mass)/(distance * distance);
    force.normalize();
    force.mult(-1 * strength);
    return force;
  }
    
  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void checkEdges() {
    float z = random(1);
    if (z > 0.95) {
      if (position.x < 10 || position.x > width-10) velocity.x *= -0.8;
      else if (position.y < 10 || position.y > width-10) velocity.y *= -0.8; 
    }
    position.x = constrain(position.x, 10, width-10);
    position.y = constrain(position.y, 10, height-10);
  }
}