
class Bench {
  private static class Rectangle {
    public final float lx, by, rx, ty;
    public Rectangle (float lx, float by, float rx, float ty) {
      this.lx = lx;
      this.by = by;
      this.rx = rx;
      this.ty = ty;
    }

    public String toString () {
      return "Rectangle lx:" + lx + " by:" + by + " rx:" + rx + " ty:" + ty;
    }
  }

  public static Rectangle union (Rectangle r1, Rectangle r2) {
    return new Rectangle( Math.min(r1.lx, r2.lx)
                        , Math.min(r1.by, r2.by)
                        , Math.max(r1.rx, r2.rx)
                        , Math.max(r1.ty, r2.ty) );
  }

  public static void main (String[] args) {
    Rectangle k = new Rectangle(25, 25, 200, 200);
    for (int i = 0; i < 1000000000; i++) {
      k = union(k, new Rectangle(20, 0, 100, i));
    }
    System.out.println(k);
  }
}