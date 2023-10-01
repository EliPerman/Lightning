int startX = 0;
int startY = 150;
int endX = 0;
int endY = 150;
float R = (float)(255 * Math.random());
float G = (float)(255 * Math.random());
float B = (float)(255 * Math.random());

void setup()
{
  size(300, 300);
  strokeWeight(5);
  background(0);
  frameRate(50);
}

void draw()
{
  fill(0, 0, 0, 10);
  rect(0, 0, 300, 300);
  
  //Assignment requires that void draw() uses stroke() and a while loop. They are being used, but are within lightning() which is called below.
  lightning(1);
}

void lightning(float split)
{
  int tempX;
  int tempY;
  float tempR;
  float tempG;
  float tempB;
  
  while (endX < 300){
    endX = endX + (int)(10 * Math.random());
    endY = endY + (int)(Math.pow(1.25, split - 1) * (20 * Math.random() - 10));
    R = R + 50 * ((float)Math.random() - 0.5);
    R = Math.max(0, Math.min(255, R));
    G = G + 50 * ((float)Math.random() - 0.5);
    G = Math.max(0, Math.min(255, G));
    B = B + 50 * ((float)Math.random() - 0.5);
    B = Math.max(0, Math.min(255, B));
    
    strokeWeight((float)Math.max(5 * Math.pow(0.5, split), 0));
    stroke(R, G, B);
    line(startX, startY, endX, endY);
    
    startX = tempX = endX;
    startY = tempY = endY;
    tempR = R;
    tempG = G;
    tempB = B;

    if (Math.random() < 0.05 * Math.pow(0.8, split))
    {
    lightning(split + 1);
    }
    
    startX = endX = tempX;
    startY = endY = tempY;
    R = tempR;
    G = tempG;
    B = tempB;
  }
}

void mousePressed()
{
  startX = 0;
  startY = 150;
  endX = 0;
  endY = 150;
  R = (float)(255 * Math.random());
  G = (float)(255 * Math.random());
  B = (float)(255 * Math.random());
}
