// Based on https://github.com/keijiro/sketches2016/blob/master/Cubes3/Cubes3.pde
void setup()
{
  colorMode(RGB, 1.0);
  size(500, 500, P3D);
  frameRate(24);
}

void draw()
{
  int frames = 24 * 3;
  float t = (float)frameCount / frames;

  background(0);
  noStroke();

  perspective(0.5, 1, 0.01, 200);

  camera(
    0, 0, 105 + sin(PI * 2 * t) * 3,
    0, 0, 0,
    0, 1, 0
  );

  rotateX(-0.5 - 0.05 * sin(PI * 4 * t));
  rotateY(t * PI);

  int columns = 28;
  for (int ix = 0; ix < columns; ix++)
  {
    float x = ix - 0.5 * columns + 0.5;
    for (int iy = 0; iy < columns; iy++)
    {
      float y = iy - 0.5 * columns + 0.5;
      for (int iz = 0; iz < columns; iz++)
      {
        float z = iz - 0.5 * columns + 0.5;
        float d = sqrt(x * x + y * y + z * z);
        float s = abs(sin(d - t * 4 * PI));

        pushMatrix();
        translate(x, z, y);

        // blue cyan pink
        fill(palette(d * 0.4,
                     new PVector(1.848, 0.788, 1.298),
                     new PVector(-1.922, 0.500, 0.500),
                     new PVector(-0.372, 1.000, 1.000),
                     new PVector(0.068, -0.352, 0.945)));

        // rainbow
        // fill(palette(d * 0.4,
        //             new PVector(0.5, 0.5, 0.5),
        //             new PVector(0.5, 0.5, 0.5),
        //             new PVector(1.0, 1.0, 1.0),
        //             new PVector(0.01, 0.33, 0.67)));

        // yellow purple magenta
        // fill(palette(d * 0.2,
        //             new PVector(0.731, 1.098, 0.192),
        //             new PVector(0.358, 1.090, 0.657),
        //             new PVector(1.077, 0.360, 0.328),
        //             new PVector(0.965, 2.265, 0.837)));

        box(s);
        popMatrix();
      }
    }
  }
  // if (frameCount <= frames) saveFrame();
}

color palette(float t,  PVector dc_offset,  PVector amp,  PVector freq,  PVector phase){
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
