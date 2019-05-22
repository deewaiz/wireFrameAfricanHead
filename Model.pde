import java.util.*;
BufferedReader reader;

public class Model
{
  //public float[][] v;
  private String line;
  //private List<Float> vX = new ArrayList<Float>();
  //private List<Float> vY = new ArrayList<Float>();
  //private List<Float> vZ = new ArrayList<Float>();
  private List<Vec3iCoord> V = new ArrayList<Vec3iCoord>();
  
  //private List<Integer> f1 = new ArrayList<Integer>();
  //private List<Integer> f2 = new ArrayList<Integer>();
  //private List<Integer> f3 = new ArrayList<Integer>();
  private List<Vec3iFace> F = new ArrayList<Vec3iFace>();

  //public float getvX(int n) { return vX.get(n); }
  //public float getvY(int n) { return vY.get(n); }
  //public float getvZ(int n) { return vZ.get(n); }
  public Vec3iCoord getVtx(int n) { return V.get(n); }
  public int getVtxCount() { return V.size(); }
  
  //public int getf1(int n) { return f1.get(n); }
  //public int getf2(int n) { return f2.get(n); }
  //public int getf3(int n) { return f3.get(n); }
  public Vec3iFace getFace(int n) { return F.get(n); }
  public int getFaceCount() { return F.size(); }


  private int v = 0;
  private int f = 0;
  
  Model(String fileName)
  {
    reader = createReader(fileName);
    line = "";
    
    while(line != null)
    {
      try { line = reader.readLine(); }
      catch (IOException e) { e.printStackTrace(); line = null; }
      if (line == null) { noLoop(); }
      else
      {
        // Parsing vertexes
        if (match(line, "v ") != null)
        {
          String vertex[] = line.split(" ");
          //vX.add(Float.parseFloat(vertex[1]));
          //vY.add(Float.parseFloat(vertex[2]));
          //vZ.add(Float.parseFloat(vertex[3]));
          V.add(new Vec3iCoord((int)((Float.parseFloat(vertex[1]) + 1) * width / 2), 
                                (int)((Float.parseFloat(vertex[2]) + 1) * height / 2), 
                                (int)((Float.parseFloat(vertex[3]) + 1) * (width + height) / 4)));
          //println("X is " + V.get(v).x + ", Y is " + V.get(v).y + ", Z is " + V.get(v).z);
          v++;
        }
        // Parsing faces
        if (match(line, "f ") != null)
        {
          String faces[] = line.split(" ");
          //f1.add(Integer.parseInt(faces[1].split("/")[0]));
          //f2.add(Integer.parseInt(faces[2].split("/")[0]));
          //f3.add(Integer.parseInt(faces[3].split("/")[0]));
          F.add(new Vec3iFace(Integer.parseInt(faces[1].split("/")[0]),
                               Integer.parseInt(faces[2].split("/")[0]),
                               Integer.parseInt(faces[3].split("/")[0])));
          //println("F1 is " + F.get(f).face1 + ", F2 is " + F.get(f).face2 + ", F3 is " + F.get(f).face3);
          f++;
        }
      }
    }
  }
  

}
