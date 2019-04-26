boolean saveMode = false;

PImage img;

void settings() {
  img = loadImage("lena_monokuro.png");
  img.loadPixels();
  size(img.width, img.height);
}

void setup() {
  smooth();
  frameRate(12);
}

void draw() {
  int x, y, pos;

  background(255);
  loadPixels();

  for (y = 0; y < img.height; y = y+2) {
    for (x = 0; x < img.width; x = x+2) {
      // 現在の位置を取得
      pos = (y*img.width) + x;
      // 現在の位置の色取得
      color c = img.get(x, y);
      
      float r = red(c);
      float g = green(c);
      float b = blue(c);

      float grey = 0.3 * r + 0.59 * g + 0.11 * b;

      float brightness = brightness(c);
      
      if (brightness <= 60) {
        // g = g + (255+brightness)%255;
        g = 255.0 * grey / 60.0;
        stroke(0 ,0, g, 200);
      } else if (brightness <= 120) {
        // b = b + (255+brightness)%255;
        b = -255.0 * grey / 60.0 + 510;
        stroke(0, b, 0, 200);
      } else if (brightness <= 255) {
        // r = r + (255+brightness)%255;
        r = 255.0 * grey / 60.0 - 510;
        stroke(r, 0, 0, 200);
      }
      line(x, y, x+1, y+1);
    }
  }

  if (saveMode) {
    saveFrame("frames/frame-####.png");
    delay(100);
    exit();
  }
}

void keyPressed() {
  if (key == 's') saveMode = true;
}