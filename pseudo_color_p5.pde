PImage img;

void settings() {
  img = loadImage("lena.png");
  img.loadPixels();
  size(img.width, img.height);
}

void setup() {
  frameRate(12);
}

void draw() {
  int x, y, pos;

  background(0);
  loadPixels();

  for (y = 0; y < img.height; y++) {
    for (x = 0; x < img.width; x++) {
      pos = (y*width) + x;
      pixels[pos] = img.pixels[pos];
    }
  }
  updatePixels();
}