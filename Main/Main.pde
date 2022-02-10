import org.openkinect.freenect.*;
import org.openkinect.freenect2.*;
import org.openkinect.processing.*;
import org.openkinect.tests.*;

PImage img;

// size of the text output
int resolution = 12;

// Kinect Library object
Kinect kinect;

// We'll use a lookup table so that we don't have to repeat the math over and over
float[] depthLookUp = new float[2048];


// minimum and maximum threshold value for depth
int minDist = 100;
int maxDist = 800;

void setup() {

  size(650,480);
  background(0);
  fill(255);
  noStroke();
  
  kinect = new Kinect(this);
  kinect.initDepth();
  
  // Lookup table for all possible depth values (0 - 2047)
  for (int i = 0; i < depthLookUp.length; i++) {
    depthLookUp[i] = rawDepthToMeters(i);
  }
  
  PFont mono = createFont("Courier", resolution + 2);
  textFont(mono);

  
}


void draw(){ 
  img = kinect.getDepthImage();
  clear();
  convert();
}

void convert() {

  img.loadPixels();
  int[] depth = kinect.getRawDepth();
  
  // grab the color of every nth pixel in the image
  // and replace it with the mapped rawDepth data
  for (int y = 0; y < img.height; y += resolution) {
    for (int x = 0; x < img.width; x += resolution) {
      int offset = x + y*kinect.width;

      // Convert kinect data to numbers
      int rawDepth = depth[offset];
      
      // threshold value for depth
      if (rawDepth > minDist && rawDepth < maxDist){
      int dist = (int) map(rawDepth, minDist, maxDist, 0 ,9);
      text(dist, x, y);
      }
    }
  }
}


// These functions come from: http://graphics.stanford.edu/~mdfisher/Kinect.html
float rawDepthToMeters(int depthValue) {
  if (depthValue < 2047) {
    return (float)(1.0 / ((double)(depthValue) * -0.0030711016 + 3.3309495161));
  }
  return 0.0f;
}
