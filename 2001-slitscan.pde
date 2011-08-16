/**
 * 2001-slitscan
 *
 * GSVideo version by Andres Colubri.
 * 
 * slitscans a video file or gstreamer pipe to look like 2001.
 */
import codeanticode.gsvideo.*;

PImage img, img2, img3;
GSCapture cam;

int xspeed=100;
int yspeed=0;
int speedwidth=40;

GSMovie movie;


public void setup() {
  size(641, 480);
  frameRate(200);

  movie = new GSMovie(this, "test.avi");
  movie.play();
  movie.loop();
  movie.speed(10);
  movie.volume(0);
  /*
  // You can get the resolutions supported by the
   // capture device using the resolutions() method.
   // It must be called after creating the capture
   // object.
   int[][] res = cam.resolutions();
   for (int i = 0; i < res.length; i++) {
   println(res[i][0] + "x" + res[i][1]);
   }
   */

  /*
  // You can also get the framerates supported by the
   // capture device:
   String[] fps = cam.framerates();
   for (int i = 0; i < fps.length; i++) {
   println(fps[i]);
   }
   */

  img=createImage(width, height, ARGB);
  img2=createImage(width/2, height, ARGB);
  img3=createImage(width/2, height, ARGB);
  background(0);
}

public void movieEvent(GSMovie movie) {
  movie.read();
}

public void draw() {

  img=movie.get();

  if (keyPressed==true && key=='z') {
    xspeed=int(map(mouseX, 0, width, 0, width/3));
    yspeed=int(map(mouseY, 0, height, -height/4, height/4));
  }
  if (keyPressed==true && key=='x') {
    speedwidth=int(map(mouseX, 0, width, 1, width/3));
  }

  blend(img2, 0, 0, width/2, height, 
  width/2, 0, width/2, height, BLEND);

  blend(img3, 0, 0, width/2, height, 
  0, 0, width/2, height, BLEND);

  blend(movie, movie.width/2-speedwidth/2, 0, speedwidth, movie.height, 
  width/2-speedwidth/2, 0, speedwidth, height, BLEND);

  img2 = get(width/2-speedwidth/2, -yspeed, width/2-xspeed, height-yspeed);
  img3 = get(xspeed+speedwidth/2, -yspeed, width/2-xspeed, height-yspeed);
}

