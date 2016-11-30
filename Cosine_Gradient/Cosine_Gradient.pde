void setup() {
  size(700, 500);
  noLoop();
  size(500, 460);
  colorMode(RGB, 1.0);
}

void draw() {
  background(0);
  noStroke();

  // examples from http://www.iquilezles.org/www/articles/palettes/palettes.htm
  gradiantRow(20,
      new PVector(0.5, 0.5, 0.5),
      new PVector(0.5, 0.5, 0.5),
      new PVector(1.0, 1.0, 1.0),
      new PVector(0.01, 0.33, 0.67));


  gradiantRow(60,
      new PVector(0.5, 0.5, 0.5),
      new PVector(0.5, 0.5, 0.5),
      new PVector(1.0, 1.0, 1.0),
      new PVector(0.0, 0.10, 0.20));

  gradiantRow(100,
      new PVector(0.5, 0.5, 0.5),
      new PVector(0.5, 0.5, 0.5),
      new PVector(1.0, 1.0, 1.0),
      new PVector(0.30, 0.20, 0.20));

  gradiantRow(140,
              new PVector(0.5, 0.5, 0.5),
              new PVector(0.5, 0.5, 0.5),
              new PVector(1.0, 1.0, 0.5),
              new PVector(0.80, 0.90, 0.30));

  gradiantRow(180,
              new PVector(0.5, 0.5, 0.5),
              new PVector(0.5, 0.5, 0.5),
              new PVector(1.0, 0.7, 0.4),
              new PVector(0.0, 0.15, 0.20));

  gradiantRow(220,
              new PVector(0.5, 0.5, 0.5),
              new PVector(0.5, 0.5, 0.5),
              new PVector(2.0, 1.0, 0.0),
              new PVector(0.5, 0.20, 0.25));

  gradiantRow(260,
              new PVector(0.8, 0.5, 0.4),
              new PVector(0.2, 0.4, 0.2),
              new PVector(2.0, 1.0, 0.0),
              new PVector(0.0, 0.25, 0.25));

  // from/made with http://dev.thi.ng/gradients/

  //blue cyan pink
  gradiantRow(300,
              new PVector(1.848, 0.788, 1.298),
              new PVector(-1.922, 0.500, 0.500),
              new PVector(-0.372, 1.000, 1.000),
              new PVector(0.068, -0.352, 0.945));

  //yellow-green-blue
  gradiantRow(340,
              new PVector(0.650,0.500,0.310),
              new PVector(-0.650,0.500,0.600),
              new PVector(0.333,0.278,0.278),
              new PVector(0.660,0.000,0.667));
  // yellow purple magenta
  gradiantRow(380,
              new PVector(0.731, 1.098, 0.192),
              new PVector(0.358, 1.090, 0.657),
              new PVector(1.077, 0.360, 0.328),
              new PVector(0.965, 2.265, 0.837));

  //yellow magenta cyan
  gradiantRow(420,
              new PVector(1.000, 0.500, 0.500),
              new PVector(0.500, 0.500, 0.500),
              new PVector(0.750, 1.000, 0.667),
              new PVector(0.800, 1.000, 0.333));
  saveFrame();
}

void gradiantRow(int y, PVector a, PVector b, PVector c, PVector d){
  int size = 5;
  for (int i = 0; i < (width / size); i++) {
    fill(palette(i * 0.01, a, b, c, d));
    rect(i * size, y, size, size + 20);
  }
}

color palette(float t,  PVector dc_offset,  PVector amp,  PVector freq,  PVector phase){
  // based on http://www.iquilezles.org/www/articles/palettes/palettes.htm
  // also see http://dev.thi.ng/gradients/ for more examples and to use an interactive cosine gradient generator editor
  float[] a = dc_offset.array();
  float[] b = amp.array();
  float[] c = freq.array();
  float[] d = phase.array();

  float[] palette = new float[3];
  for (int i =  0; i <  c.length; i++) {
    c[i] *= t;
    c[i] += d[i];
    float r = cos(c[i] * TWO_PI);
    r *= b[i];
    r += a[i];
    palette[i] = constrain(r, 0, 1);
  }

  return color(palette[0], palette[1], palette[2]);
}
