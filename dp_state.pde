int currentTime;
int previousTime;
int deltaTime;

boolean saveVideo = false;

Heroine h;

void setup () {
  size (800, 600);
  currentTime = millis();
  previousTime = millis();
  
  h = new Heroine();
  
}

void draw () {
  currentTime = millis();
  deltaTime = currentTime - previousTime;
  previousTime = currentTime;

  handleInput();
  update(deltaTime);
  display();
  
  savingFrames(5, deltaTime);  
}

void handleInput(){
  if (keyPressed) {
    h.handleInput(key);
  }
}
/***
  The calculations should go here
*/
void update(int delta) {
  h.update(delta);
}

/***
  The rendering should go here
*/
void display () {
  h.display();
}

//Saving frames for video
//Put saveVideo to true;
int savingAcc = 0;
int nbFrames = 0;

void savingFrames(int forMS, int deltaTime) {
  
  if (!saveVideo) return;
  
  savingAcc += deltaTime;
  
  if (savingAcc < forMS) {
    saveFrame("frames/####.tiff");
	nbFrames++;
  } else {
	println("Saving frames done! " + nbFrames + " saved");
    saveVideo = false;
  }
}
