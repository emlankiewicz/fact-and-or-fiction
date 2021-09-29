/*
Projects 2: Truth and/or Fiction
by Emily Lankiewicz and Clara Richter

Instructions: 
Click around the scene to find the truth!

*/

PImage firstMount;
PImage secondMount;
PImage thirdMount;
PImage sky;
PImage waves;
PImage firstCloud;
PImage secondCloud;
PImage Nessie;
PImage unicorn;
PImage yeti;


PImage[] clouds = new PImage[3];

float[] cloudX = new float[3];
float[] cloudY = new float[3];

float bigShowNessieTime = -1;
float bigHideNessieTime = -1;
float bigMaxNessieHeight = 150;
float bigCurrentNessieHeight = 0;

float mediumShowNessieTime = -1;
float mediumHideNessieTime = -1;
float mediumMaxNessieHeight = 150;
float mediumCurrentNessieHeight = 0;

float smallShowNessieTime = -1;
float smallHideNessieTime = -1;
float smallMaxNessieHeight = 80;
float smallCurrentNessieHeight = 0;

float showYeti = -1;
float hideYeti = -1;
float maxYeti = 200;
float currentYeti = 0;

float showUnicorn = -1;
float hideUnicorn = -1;
float maxUnicorn = 70;
float currentUnicorn = 0;

float xLeft = -50;
float xRight = 0;
float shift = 1;
float shiftRight = 1;

float waveMovement = 0;
float waveUp = 1;


void setup () {
  size(900, 500);
  sky = loadImage("background.jpg");
  firstMount = loadImage("Mountain 1.png");
  secondMount = loadImage("Mountain 2.png");
  thirdMount = loadImage("Mountain 3.png");
  waves = loadImage("wave.png");
  
  unicorn = loadImage("Unicorn.png");
  yeti = loadImage("Yeti.png");
  
  clouds[0] = loadImage("Cloud 1.png");
  clouds[1] = loadImage("Cloud 2.png");
  clouds[2] = loadImage("Cloud 1.png");

  cloudX[0] = -100;
  cloudY[0] = -20;

  cloudX[1] = 250;
  cloudY[1] = -50;

  cloudX[2] = 400;
  cloudY[2] = -20;

  Nessie = loadImage("Nessie.png");
}


boolean clickedInBox(float x, float y, float w, float h) {
  return ((mouseX >=x) && (mouseY >= y) &&
    (mouseX <= x+w) && (mouseY <= y +h));
}

void mouseClicked() {
  println("got mouseClicked");
  if ((bigShowNessieTime < 0) && 
    (bigHideNessieTime < 0) && (mediumShowNessieTime < 0) && 
    (mediumHideNessieTime < 0) && (smallShowNessieTime < 0) && 
    (smallHideNessieTime < 0)) {
    if (clickedInBox(0, 300, 500, 300)) {
      println("setting nessie time");
      bigShowNessieTime = millis() + .05 * 1000;
    }
    //if clicked on med box
    if (clickedInBox(500,300,300,90)) {
      println("setting nessie time");
      mediumShowNessieTime = millis() + .05 * 1000;
    }
    // if clicked on small box
    if (clickedInBox(400, 240, 340, 60)) {
      println("setting nessie time");
      smallShowNessieTime = millis() + .05 * 1000;
    
    }
  
}

   if ((showYeti < 0) && (hideYeti < 0)){
    if (clickedInBox(800, 250, 900, 900)) {
      println("Setting Yeti time");
      showYeti = millis() + .05 * 1000;
  }
  if (clickedInBox(240, 80, 230, 155)) {
      println("Setting Unicorn time");
      showUnicorn = millis() + .05 * 1000;
  }
}
}


void draw () { 


 
  image(sky, 0, 0, width, height);
  for (int i =0; i < clouds.length; i++) {
    image (clouds[i], cloudX[i], cloudY[i], 160, 160);
    cloudY[i]=cloudY[i]+(cos((.06*cloudX[i]+40)%width )*1);
    cloudX[i]=cloudX[i]+2;
    if (cloudX[i]>width) {
      cloudX[i]=-165;
      cloudY[i]=random(-40, -20);
    }
  }  

//Wave Movement
xLeft +=shift;
if(xLeft>=0){
  shift=-1;
}
if (xLeft<=-50){
  shift=1;
}
xRight += shiftRight;
if(xRight<=-50){
  shiftRight=1;
}
if (xRight>=0){
  shiftRight=-1;
}

waveMovement += waveUp;
if(waveMovement<=0){
  waveUp=.5;
}
if (waveMovement>=3){
  waveUp=-.5;
}


  //Big Nessie
  if (bigShowNessieTime >= 0) {
    if (millis() >= bigShowNessieTime) {
      if (bigCurrentNessieHeight < bigMaxNessieHeight) {
        bigCurrentNessieHeight = bigCurrentNessieHeight+15;
      } else {
        //done rising
        bigHideNessieTime = millis() +  1 * 1000;
        bigShowNessieTime = -1;
      }
    }
  } else if (bigHideNessieTime >= 0) {
    if (millis() >= bigHideNessieTime) {
      if (bigCurrentNessieHeight > 0) {
        bigCurrentNessieHeight = bigCurrentNessieHeight-10;// 1 changes speed
      } else {
        bigHideNessieTime = -1;
      }
    }
  }
  
  //Medium Nessie
  if (mediumShowNessieTime >= 0) {
    if (millis() >= mediumShowNessieTime) {
      if (mediumCurrentNessieHeight < mediumMaxNessieHeight) {
        mediumCurrentNessieHeight = mediumCurrentNessieHeight+15;
      } else {
        //done rising
        mediumHideNessieTime = millis() +  1 * 1000;
        mediumShowNessieTime = -1;
      }
    }
  } else if (mediumHideNessieTime >= 0) {
    if (millis() >= mediumHideNessieTime) {
      if (mediumCurrentNessieHeight > 0) {
        mediumCurrentNessieHeight = mediumCurrentNessieHeight-7;// 1 changes speed
      } else {
        mediumHideNessieTime = -1;
      }
    }
  }

//Small Nessie
  if (smallShowNessieTime >= 0) {
    if (millis() >= smallShowNessieTime) {
      if (smallCurrentNessieHeight < smallMaxNessieHeight) {
        smallCurrentNessieHeight = smallCurrentNessieHeight+15;
      } else {
        //done rising
        smallHideNessieTime = millis() +  1 * 1000;
        smallShowNessieTime = -1;
      }
    }
  } else if (smallHideNessieTime >= 0) {
    if (millis() >= smallHideNessieTime) {
      if (smallCurrentNessieHeight > 0) {
        smallCurrentNessieHeight = smallCurrentNessieHeight-5;// 1 changes speed
      } else {
        smallHideNessieTime = -1;
      }
    }
  }
  
  //Yeti
  if (showYeti >= 0) {
    if (millis() >= showYeti) {
      if (currentYeti < maxYeti) {
        currentYeti = currentYeti+35;
      } else {
        //done rising
        hideYeti = millis() +  1 * 1000;
        showYeti = -1;
      }
    }
  } else if (hideYeti >= 0) {
    if (millis() >= hideYeti) {
      if (currentYeti > 0) {
        currentYeti = currentYeti-5;// 1 changes speed
      } else {
        hideYeti = -1;
      }
    }
  }
  
    //Unicorn
  if (showUnicorn >= 0) {
    if (millis() >= showUnicorn) {
      if (currentUnicorn < maxUnicorn) {
        currentUnicorn = currentUnicorn+5;
      } else {
        //done rising
        hideUnicorn = millis() +  1 * 1000;
        showUnicorn = -1;
      }
    }
  } else if (hideUnicorn >= 0) {
    if (millis() >= hideUnicorn) {
      if (currentUnicorn > 0) {
        currentUnicorn = currentUnicorn-10;// 1 changes speed
      } else {
        hideUnicorn = -1;
      }
    }
  }

  image(secondMount, 630, 100, 200, 200);
  image(firstMount, 300, 75, 250, 200);

  image(unicorn, 300+currentUnicorn,140,75,100);
  
  wave (xRight, 230, 950, 40);
  image(thirdMount, 190, 60, 300, 250);
  //Nessie small
  image(Nessie, 410, 270-smallCurrentNessieHeight, 120, 100);
  //trigger wave for Nessie small
  wave (xLeft, 240-waveMovement, 950, 60);
  wave (xRight, 260, 950, 60);
  image(secondMount, 20, 50, 300, 300);
  image(firstMount, -70, 75, 300, 300);
  image(thirdMount, 700, 100, 300, 250);
  wave (xLeft, 280-waveMovement, 950, 70);
  wave (xRight, 300, 950, 70);
  //Nessie medium 
  image(Nessie, 520, 350-mediumCurrentNessieHeight, 200, 180);
  //trigger wave for Nessie medium
  wave (xLeft, 320-waveMovement, 950, 90);
  wave (xRight, 350, 950, 100);
  //Nessie big
  image(Nessie, 130, 427-bigCurrentNessieHeight, 220, 200);
  //trigger wave for Nessie big
  wave (xLeft, 400-waveMovement, 950, 105);
  //NEW YETI
  image(yeti, 800-currentYeti,300, 250,318);
  //NEW YETI
  image(firstMount, 700, 150, 450, 400);



}

void wave(float cornerX, float cornerY, float ratioX, float ratioY) {
  image(waves, cornerX, cornerY, ratioX, ratioY);
}