class CyclicAutomaton extends Automaton {
  int _threshold = 2;
  
  CyclicAutomaton(int w, int h) {
    this(w, h, 3);
  }
  
  CyclicAutomaton(int w, int h, int nStates) {
    super(w, h);
    _threshold = 1;

    _nStates = nStates;
    _color = new color[_nStates];
    colorMode(HSB);
    for (int i = 0; i < _nStates; i++) {
      _color[i] = color(map(i, 0, _nStates, 0, 360), 255, 255);
    }
    colorMode(RGB);
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
    return (neighbors >= _threshold) ? (oldState + 1) % _nStates : oldState;
  }

  
}
