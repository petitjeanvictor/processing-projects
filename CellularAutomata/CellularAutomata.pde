Automaton ca;

int framesToSkip = 1;
boolean isPlaying = false;
boolean displayHelp = false;

void setup() {
  size(600, 600);
  ca = new CyclicAutomaton(300, 300, 16);
  //ca = new GameOfLife(300, 300);
  //ca = new RPSAutomaton(300, 300);
  ca.initializeRandom();
}

void draw() {
  if (isPlaying && (frameCount % framesToSkip == 0)) {
    ca.step();
  }
  ca.show();

  if (displayHelp) {
    String helpText = "SPACE: stop or start running\n";
    helpText += "UP/DOWN: speed up or down\n";
    helpText += "   currently 1 / " + framesToSkip + "\n";
    helpText += "RIGHT: one step\n";
    helpText += "R: blank grid\n";
    helpText += "A: random grid\n";

    fill(255, 0, 0, 200);
    noStroke();
    rect(10, height - 210, 300, 200);
    fill(0);
    textSize(20);
    textAlign(LEFT);
    text(helpText, 10 + 5, height - 210 + 25);
  } else {
    fill(255, 0, 0, 200);
    noStroke();
    rect(10, height - 50, 200, 40);
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text("Press H for help", 10 + 100, height - 30);
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    ca.step();
  } else if (keyCode == DOWN) {
    framesToSkip  = min(32, framesToSkip * 2);
  } else if (keyCode == UP) {
    framesToSkip = max(1, framesToSkip / 2);
  } else if (key == 'r' || key == 'R') {
    ca.reset();
  } else if (key == ' ') {
    isPlaying = !isPlaying;
  } else if (key == 'h' || key == 'H') {
    displayHelp = !displayHelp;
  } else if (key == 'a' || key == 'A') {
    ca.initializeRandom();
  }
}

void mousePressed() {
  if (mouseX < width && mouseX > 0 && mouseY < height && mouseY > 0) {
    ca.flip(mouseX, mouseY);
  }
}
void mouseDragged() {
  if (mouseX < width && mouseX > 0 && mouseY < height && mouseY > 0) {
    ca.flip(mouseX, mouseY);
  }
}
