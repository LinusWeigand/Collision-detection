public class Rectangle{
  private double x,y,w,h;
  private double m,v;
  
  public Rectangle(double x,double y,double w,double m, double v){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = w;
    this.m = m;
    this.v = v;

  }
 public boolean intersects(Rectangle other){
   if(this.x + this.w < other.x){
     return false;
   }else{
  return true; 
   }
 }
 
 public double bounce(Rectangle other){
   double sumM = this.m + other.m;
   double newV = (this.m - other.m)/sumM * this.v;
   newV += (2 * other.m / sumM) * other.v;
   return newV;
 }
 
 public boolean bounceWithWall(){
   if(this.x >= 0){
     return false;
   }else{
  return true;
   }
 }

 
 public void update(){
   x += v;
 }
 
 public void draw(){
 
  fill(255);
  rect((float)x,(float)y,(float)w,(float)h);
 }

}