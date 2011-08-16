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
  /*
  // List functionality still not ready on Linux
   String[] cameras = GSCapture.list();
   
   if (cameras.length == 0)
   {
   println("There are no cameras available for capture.");
   exit();
   } else {
   println("Available cameras:");
   for (int i = 0; i < cameras.length; i++)
   println(cameras[i]);
   cam = new GSCapture(this, 640, 480, cameras[0]);
   }
   
   However, different cameras can be selected by using their device file:
   cam = new GSCapture(this, 640, 480, "/dev/video0");
   cam = new GSCapture(this, 640, 480, "/dev/video1");
   etc.
   */

  //cam = new GSCapture(this, width, height);
  //cam.start();  

  movie = new GSMovie(this, "balloon.ogg");
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
  //tint(255, 100);
  //blend(0, 0, width, height, 0, 0, width, height, BLEND);

  //pushMatrix();
  //  translate(width/2, height/2);
  //rotate(sin(millis()%10000)*PI*2);
  //image(movie.get(width/2-1, 0, 2, height), -1, -height/2);
  //den gamle:

  blend(img2, 0, 0, width/2, height, 
  width/2, 0, width/2, height, BLEND);

  blend(img3, 0, 0, width/2, height, 
  -1, 0, width/2, height, BLEND);

  blend(movie, movie.width/2-speedwidth/2, 0, speedwidth, movie.height, 
  width/2-speedwidth/2, 0, speedwidth, height, BLEND);

  img2 = get(width/2-speedwidth/2, 0, width/2-xspeed, height);
  img3 = get(xspeed+speedwidth/2, 0, width/2-xspeed, height);
}
