Line line = new Line(); //<>//

void setup()
{
  size(800, 800);
  background(color(0, 0, 0));
}

void draw()
{
  Model head = new Model("african_head.obj");
  for (int i = 0; i < head.getFaceCount(); i++)  //<>//
  {
    Vec2i p0 = new Vec2i(head.getVtx(head.getFace(i).face1 - 1).x, head.getVtx(head.getFace(i).face1 - 1).y);
    Vec2i p1 = new Vec2i(head.getVtx(head.getFace(i).face2 - 1).x, head.getVtx(head.getFace(i).face2 - 1).y);
    line.plotLine(p0, p1, color(255, 255, 255));
    
    p0 = new Vec2i(head.getVtx(head.getFace(i).face2 - 1).x, head.getVtx(head.getFace(i).face2 - 1).y);
    p1 = new Vec2i(head.getVtx(head.getFace(i).face3 - 1).x, head.getVtx(head.getFace(i).face3 - 1).y);
    line.plotLine(p0, p1, color(255, 255, 255));
        
    p0 = new Vec2i(head.getVtx(head.getFace(i).face3 - 1).x, head.getVtx(head.getFace(i).face3 - 1).y);
    p1 = new Vec2i(head.getVtx(head.getFace(i).face1 - 1).x, head.getVtx(head.getFace(i).face1 - 1).y);
    line.plotLine(p0, p1, color(255, 255, 255));
  }


}


 
