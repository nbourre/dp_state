class Heroine extends GraphicObject {
  
  PVector size;
  HeroineState currentState;
  
  Heroine() {
    initValues();
    
    location.x = width / 2;
    location.y = height / 2;
  }
  
  void initValues() {
    location = new PVector();
    velocity = new PVector();
    acceleration = new PVector();
    
    size = new PVector(50, 100);
    
    currentState = new IdleState();
  }
  
  void handleInput(int input) {
    HeroineState _tempState = currentState.handleInput(this, input);
    
    if (_tempState != null) {
      currentState = _tempState;
    }
  }
  
  void update (float deltatime) {
    velocity.add (acceleration);
    location.add (velocity);
    
    acceleration.mult(0);
    
    currentState.update(this);
  }
  
  
  void display() {
    pushMatrix ();
    translate(location.x, location.y);
    
    rect (0, 0, size.x, size.y);
    
    popMatrix ();
  }

}
