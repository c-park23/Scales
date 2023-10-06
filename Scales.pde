//scales B
// global variables
int rows = 5;
int cols = 10;
int mult = 100;  //  pixel coordinate scale for x and y
int off = 50;    // offset between rows and cols
float wid = 99;  // width of shape
float hgt = 99;  // height of shape
float inc = 0.5;   // amount of inc for each frame
float min = 99.0;    // min size when breathing
float max = 120.0;    //  max size when breathing
boolean grow = true;  // breathe in first!
float r, g, b, a;  //red, green, blue, alpha

void setup() {
  size(900, 400);//window size 
  r = 150;//original color 
  g = 20;
  b = 70;
  a = 255;  
  stroke(100,20,70);
  strokeWeight(7);
  
  
}

void draw() {
  background(255);
  for (int x = 0; x < cols; x++) {    // x coordinate for rows loop
    for (int y = 0; y < rows; y++) {  // y coordinate for cols loop
      draw_shape(x, y);  // draw shapes in rows and cols
    }
  }
incr_size_color();

  if (wid >= max||wid <= min) {   // toggle phases
    grow = !grow;
  }
}

void incr_size_color() {
  if (grow) {     // grow phase
    wid += inc;
    hgt += inc;
    a -= 50/(max-min);
  } else {        // shrink phase
    wid -= inc;
    hgt -= inc;
    a += 50/(max-min);
  }
}


void draw_shape(float x, float y) {
  rectMode(CENTER);
  fill(r, g, b, a);
  ellipse(x*mult+off, y*mult+10, wid, hgt);  // draw shapes in rows and cols}
  ellipse(x*mult+5, y*mult+off, wid, hgt);  // draw shapes in rows and cols}

  

}
void changeColor(){
  r = (int)(Math.random()*256);
  g = (int)(Math.random()*256);
  b = (int)(Math.random()*256);
  a= 255;


}

void mouseClicked(){//change color by click
  changeColor();
}

