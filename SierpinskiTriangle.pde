double tX = 0.0;
double tY = 0.0;
double sF = 1.0;
public void setup(){
  size(600, 600);
  background(255);
  noStroke();
  fill(0);
    
}
public void draw(){
  background(255);
  sierpinski(tX + (width / 2.0 * sF), tY + (20.0 * sF), (width - 40.0) * sF, 0);
}
public void sierpinski(double x, double y, double len, int lvl) {
  if (x + len/2 < 0 || x - len/2 > width || y + len < 0 || y > height){
    return;
  }
  if (len < 10 || lvl > 45) 
  {
    fill(220, lvl * 4 % 255, 10);
    triangle((float)x, (float)y, (float)(x - len / 2.0), (float)(y + len), (float)(x + len / 2.0), (float)(y + len));
  }
  else{
    sierpinski(x, y, len/2, lvl + 1);
    sierpinski(x - len/4, y + len/2, len/2, lvl + 1);
    sierpinski(x + len/4, y + len/2, len/2, lvl + 1);
  }
}
void mouseDragged(MouseEvent e) {
  tX += mouseX - pmouseX;
  tY += mouseY - pmouseY;
}
void mousewheel(MouseEvent e) {
  double f = 1.0;
  if (e.getCount() < 0 && sF < 2000000000000.0) {
    f = 1.1;
  } 
  else if (e.getCount() > 0 && sF > .5) {
    f = 0.9; 
  }
  tX = mouseX + (tX - mouseX) * f;
  tY = mouseY + (tY - mouseY) * f;
  sF *= f;
}
