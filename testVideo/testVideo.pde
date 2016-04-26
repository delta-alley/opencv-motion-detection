import gab.opencv.*;
import processing.video.*;

Movie video;
OpenCV opencv;
Capture capture;

void setup() {
  size(640,480);
  //video = new Movie(this, "street.mov");
  opencv = new OpenCV(this, 640, 480);
  println(Capture.list()[0]);
  capture = new Capture(this, width, height, 30);
  opencv.startBackgroundSubtraction(5, 3, 0.5);
  capture.start();
  //video.loop();
  //video.play();
}

void draw() {
  capture.read();
  image(capture, 0, 0);  
  opencv.loadImage(capture);
  
  opencv.updateBackground();
  
  opencv.dilate();
  opencv.erode();

  noFill();
  stroke(255, 0, 0);
  strokeWeight(3);
  for (Contour contour : opencv.findContours()) {
  contour.draw();
  }
}

void movieEvent(Movie m) {
  m.read();
}