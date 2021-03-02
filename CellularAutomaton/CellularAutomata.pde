Automaton ca = new Automaton(30, 30);
//RPSAutomaton ca = new RPSAutomaton(300, 300);


void setup() {
  size(600, 600);
  ca.initializeRandom();
}

void draw() {
  ca.show();
}

void keyPressed() {

  ca.step();
}
