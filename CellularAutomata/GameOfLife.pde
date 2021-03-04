class GameOfLife extends Automaton{
  GameOfLife(int w, int h) {
    super(w, h);
    
    _nStates = 2;
    _color = new color[_nStates];
    _color[0] = color(255);
    _color[1] = color(0);
  }

  void initializeGlider() {
    this.reset();
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
}
