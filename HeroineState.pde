interface HeroineState {
  abstract HeroineState handleInput (Heroine heroine, int input);
  abstract void update (Heroine heroine);
  abstract void onEnter (Heroine heroine);
  abstract void onExit (Heroine heroine);
}

class MovingState implements HeroineState {
  HeroineState handleInput (Heroine heroine, int input) {
    
    switch(input) {
      case 0 :
        return new IdleState();
    }
    
    return null;
  }
  
  void update (Heroine heroine) {
    heroine.fillColor = 0xFF0000;
  }
  void onEnter (Heroine heroine) {
    
  }
  void onExit (Heroine heroine) {
    
  }
}

class IdleState implements HeroineState {
    HeroineState handleInput (Heroine heroine, int input) {
      
      switch(input) {
        case 'w' :
        case 'a' :
        case 's' :
        case 'd' :
          return new MovingState();
          
      }
      
    return null;
  }
  
  void update (Heroine heroine) {
    heroine.fillColor = 0xFFFF00;
  }
  
  void onEnter (Heroine heroine) {
    
  }
  
  void onExit (Heroine heroine) {
    
  }
}
