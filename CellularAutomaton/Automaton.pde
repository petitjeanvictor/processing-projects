class Automaton {
  int _width, _height;
  int[][] _grid;
  int _nStates;
  color[] _color;

  Automaton(int w, int h) {
    _width = w;
    _height = h;
    _grid = new int[_width][_height];

    _nStates = 2;
    _color = new color[_nStates];
    _color[0] = color(255);
    _color[1] = color(0);
  }

  void initializeRandom() {
    for (int i = 0; i < _width; i++) {
      for (int j = 0; j < _height; j++) {
        _grid[i][j] = floor(random(_nStates));
      }
    }
  }

  void initializeGlider() {
    for (int i = 0; i < _width; i++) {
      for (int j = 0; j < _height; j++) {
        _grid[i][j] = 0;
      }
    }
    int offsetI = _width/2;
    int offsetJ = _height/2;
    _grid[offsetI  ][offsetJ  ] = 1;
    _grid[offsetI+1][offsetJ  ] = 1;
    _grid[offsetI+2][offsetJ  ] = 1;
    _grid[offsetI+2][offsetJ+1] = 1;
    _grid[offsetI+1][offsetJ+2] = 1;
  }

  int countNeighbors(int i, int j) {
    int ans = 0;
    int[] offsets = new int[]{-1, 0, 1};
    for (int di : offsets) {
      for (int dj : offsets) {
        int ni = (i + di + _width) % _width;
        int nj = (j + dj + _height) % _height;
        ans += _grid[ni][nj];
      }
    }
    return ans - _grid[i][j];
  }

  int newState(int oldState, int neighbors) {
    if (oldState == 0 && neighbors == 3)
      return 1;
    else if (oldState == 1 && !(neighbors == 2 || neighbors == 3))
      return 0;

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

    stroke(0);
    strokeWeight(1);
    for (int i = 0; i < _width; i++) {
      for (int j = 0; j < _height; j++) {
        fill(_color[_grid[i][j]]);
        rect(i * resW, j * resH, resW-1, resH-1);
      }
    }
  }
}
