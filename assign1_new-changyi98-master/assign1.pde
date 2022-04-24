int numFrames = 6;//圖片數量
PImage[] images = new PImage[numFrames];//圖片儲存
int condition;//場景切換
int xPos=80, yPos=160;
String t = "Mouse click at will";

void setup()
{
  size(640, 480, P2D);
  // Enter Your Setup Code Here
  images[0] = loadImage("img/bg.jpg");
  images[1] = loadImage("img/soil.png");
  images[2] = loadImage("img/life.png");
  images[3] = loadImage("img/soldier.png");
  images[4] = loadImage("img/robot.png");
  images[5] = loadImage("img/groundhog.png");
  smooth();
  textSize(30);
}

void mousePressed()//滑鼠按鈕
{
  if (condition == 0)//主場景
  {
    if (mouseButton == LEFT)//滑鼠左鍵切換到遊戲開始畫面
    {
      condition = 1;//遊戲開始後的畫面
    }
  }
}

void draw() {

  if (condition == 0)//主場景
  {
    noStroke();//取消粗線
    image(images[0], 0, 0);
    rect(320, 210, 100, 100);
    text(t,50,50);
  }

  if (condition == 1)//遊戲開始後的畫面
  {
    noFill();
    image(images[0], 0, 0);
    image(images[1], 0, 160);
    image(images[2], 10, 10);
    image(images[2], 80, 10);
    image(images[2], 150, 10);
    
    //---------------------------------------------------------
    if (keyPressed && key == CODED) {//上下左右-鍵盤移動
      if (keyCode == UP) {
        yPos -= 80;//一次移動的距離
      }
      if (keyCode == DOWN) {
        yPos += 80;
      }
      if (keyCode == LEFT) {
        xPos -= 80;
      }
      if (keyCode == RIGHT) {
        xPos += 80;
      }
    }
    image(images[3], xPos, yPos);//兵士
    delay(100);//延遲

    if (xPos > 640)//超過640後從0出現
    {
      xPos = 0;
    } else if (xPos < 0)//超過0後從560出現
    {
      xPos = 560;
    }
    if (yPos > 480)
    {
      yPos = 160;
    } else if (yPos < 160)
    {
      yPos = 400;
    }
    //---------------------------------------------------------
    
    image(images[4], 240, 240);
    //random(width),random(width),

    noStroke();
    fill(124, 204, 25);
    rect(0, 145, 640, 15);
    image(images[5], 290, 80);

    noStroke();
    strokeWeight (0);
    fill(255, 255, 0);
    ellipse(580, 60, 120, 120);

    noStroke();
    strokeWeight (0);
    fill(253, 184, 19);
    ellipse(580, 60, 105, 105);

    strokeWeight(10.0);
    strokeCap(ROUND);
    stroke(255, 0, 0);
  }
}
