private double fractionLength = 0.8; 
private int smallestBranch = 10; 
private double branchAngle = .2; 
private boolean on = false;
private boolean start = false;
private int count = 0;
public void setup() 
{   
	size(640,480); 
  frameRate(20);
} 
public void draw() 
{
  if(start == true){
    background(0);
    stroke(0,255,0);   
    line(320,480,320,380);
    rectMode(CENTER);
    noStroke();
    fill(0,255,0);
    rect(width - 100, height - 30, 152, 52);
    fill(0);
    rect(width - 100, height - 30, 148, 48);
    fill(0,255,0);
    rect(width - 100, height - 30, 142, 42);
    if(on == true){
      fill(0, 255, 0);
    }else{
      fill(0);
    }
    rect(width - 100, height - 30, 140, 40);
    if(on == true){
      fill(0);
    }else{
      fill(0,255,0);
    }
    textSize(20);
    text("Plant Food", width - 151, height - 22.5);
    stroke(0,255,0);
    double branchLength = Math.random()*30 + 80;
    double angle = 3*Math.PI/2;
    smallestBranch = (int)Math.random()*10 + 10;
    branchAngle = Math.random()*0.3 + 0.2;
    fractionLength = Math.random()*0.1 + 0.75;
    if(on == true){
      drawBranches(320, 380, branchLength, angle);
      frameRate(15);
    }else{
      drawBranches(320, 380, branchLength, angle);
      frameRate(1);
    }
  }else{
    background(0);
    fill(0,255,0); 
    textSize(50);
    count = count + 4;
    if(count <= 100){
      text("Loading", width/2 - 100, height/2);
    }else if(count <= 200){
      text("Loading .", width/2 - 100, height/2);
    }else if(count <= 300){
      text("Loading . .", width/2 - 100, height/2);
    }else if(count <= 400){
      text("Loading . . .", width/2 - 100, height/2);
    }else if(count <= 450){
      start = true;
    }
  }
} 
public void mouseClicked(){
  if(mouseX >= 465 && mouseX <= 616 && mouseY >= 426 && mouseY <= 478){
    if(on == true){
      on = false;
    }else{
      on = true;
    }
  }
}
public void drawBranches(int x,int y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  branchLength = fractionLength * branchLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  line(x,y, endX1, endY1);
  line(x,y, endX2, endY2);
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1);
    drawBranches(endX2, endY2, branchLength, angle2);
  }
} 
