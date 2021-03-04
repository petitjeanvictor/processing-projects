class RPSAutomaton extends Automaton {
  int _threshold = 2;

  RPSAutomaton(int w, int h) {
    super(w, h);

    _nStates = 3;
    _color = new color[_nStates];
    _color[0] = color(255, 255, 0); // rock
    _color[1] = color(0, 255, 255); // paper
    _color[2] = color(255, 0, 255); // scissor
  }

  int countNeighbors(int i, int j) {
    int winningState = (_grid[i][j] + 1) % _nStates;
    int[] offsets = new int[]{-1, 0, 1};

    int ans = 0;
    for (int di : offsets) {
      for (int dj : offsets) {
        int ni = (i + di + _width) % _width;
        int nj = (j + dj + _height) % _height;
        if (di != 0 || dj != 0) {
          ans += (_grid[ni][nj] == winningState) ? 1 : 0;
        }
      }
    }
    return ans;
  }

  int newState(int oldState, int neighbors) {
    return (neighbors > _threshold) ? (oldState + 1) % _nStates : oldState;
  }
  
  void reset() {
    this.initializeRandom();
  }

  
}
