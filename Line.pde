class Line
{
  public void plotLine(Vec2i p1, Vec2i p2, color c)
  {
    if (abs(p2.y - p1.y) < abs(p2.x - p1.x))
      if (p1.x > p2.x)
        plotLineLow(p2.x, p2.y, p1.x, p1.y, c);
      else
        plotLineLow(p1.x, p1.y, p2.x, p2.y, c);
    else
      if (p1.y > p2.y)
        plotLineHigh(p2.x, p2.y, p1.x, p1.y, c);
      else
        plotLineHigh(p1.x, p1.y, p2.x, p2.y, c);
  }

  private void plotLineLow(int x1, int y1, int x2, int y2, color c)
  {
    int dx = x2 - x1;
    int dy = y2 - y1;
    int yi = 1;
    if (dy < 0)
    {
      yi = -1;
      dy = -dy;
    }
    int D = 2*dy - dx;
    int y = y1;
    for (int x = x1; x <= x2; x++)
    {
      set(x, y, color(c));
      if (D > 0)
      {
        y += yi;
        D -= 2*dx;
      }
      D += 2*dy;
    }
  }
  
  private void plotLineHigh(int x1, int y1, int x2, int y2, color c)
  {
    int dx = x2 - x1;
    int dy = y2 - y1;
    int xi = 1;
    if (dx < 0)
    {
      xi = -1;
      dx = -dx;
    }
    int D = 2*dx - dy;
    int x = x1;
    for (int y = y1; y <= y2; y++)
    {
      set(x, y, color(c));
      if (D > 0)
      {
        x += xi;
        D -= 2*dy;
      }
      D += 2*dx;
    }
  }
}
