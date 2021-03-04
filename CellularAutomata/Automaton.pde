class Automaton {
  int _width, _height;
  int[][] _grid;
  int _nStates;
  color[] _color;

  int _prevI;
  int _prevJ;

  Automaton(int w, int h) {
    _width = w;
    _height = h;
    _grid = new int[_width][_height];

    _nStates = 2;
    _color = new color[_nStates];
    _color[0] = color(255);
    _color[1] = color(0);

    _prevI = 0;
    _prevJ = 0;
  }

  void initializeRandom() {
    for (int i = 0; i < _width; i++) {
      for (int j = 0; j < _height; j++) {
        _grid[i][j] = floor(random(_nStates));
      }
    }
  }

  void flip(float x, float y) {
    int i = floor(x * _width / width);
    int j = floor(y * _height / height);
    if (i != _prevI || j != _prevJ) {
      _grid[i][j] = (_grid[i][j] + 1) % _nStates;
      _prevI = i;
      _prevJ = j;
    }
  }
  
  void reset() {
    for (int i = 0; i < _width; i++) {
      for (int j = 0; j < _height; j++) {
        _grid[i][j] = 0;
      }
    }
  }

  int countNeighbors(int i, int j) {
    return 0;
  }

  int newState(int oldState, int neighbors) {
    return oldState;
  }

  void step() {
    int[][] next = new int[_width][_height];
    for (int i = 0; i < _width; i++) {
      for (int j = 0; j < _height; j++) {
        int neighbors = countNeighbors(i, j);
        next[i][j] = newState(_grid[i][j], neighbors);
      }
    }
    _grid = next;
  }

  void show() {
    int resW = width / _width;
    int resH = height / _height;

    noStroke();
    for (int i = 0; i < _width; i++) {
      for (int j = 0; j < _height; j++) {
        fill(_color[_grid[i][j]]);
        rect(i * resW, j * resH, resW, resH);
      }
    }
  }
}
