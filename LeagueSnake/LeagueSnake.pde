//*
// ***** SSSSSSSSSEGMENT CLASS *****
// This class will be used to represent each part of the moving snake. :)
//*

class Segment {

//Add x and y member variables. They will hold the corner location of each segment of the snake.
int x;
int y;

// Add a constructor with parameters to initialize each variable.
public Segment(int x, int y){
this.x = x;
this.y = y;
}
}


//*
// ***** GAME VARIABLES *****
// All the game variables that will be shared by the game methods are here
//*
int foodx;
int foody;
Segment head;
int snakeDir = UP;
int foodEaten = 0;
ArrayList<Segment> tail= new ArrayList<Segment>();

// ***** SETUP METHODS *****
// These methods are called at the start of the game.
//*

void setup() {
  frameRate(10);
  size(800, 800);
  head = new Segment((int)random(width/10) * 10,(int)random(height/10) * 10);
  
  dropFood();
}

void dropFood() {
  //Set the food in a new random location
    foodx = (int)random(width/10) * 10;
    foody = (int)random(height/10) * 10;
println(foody);
println(foodx);
}



//*
// ***** DRAW METHODS *****
// These methods are used to draw the snake and its food 
//*

void draw() {
  background(60,70,70);
fill(200,100,80);
drawFood();
//DRAW SNAKE STUFF
fill(10,10,200);
drawSnake();
eat();
keyPressed();
move();




}

void drawFood() {
  //Draw the food
  
  square(foodx, foody, 10);
}

void drawSnake() {
  //Draw the head of the snake followed by its tail
  square(head.x, head.y, 10);
manageTail();
drawTail();

}


//*
// ***** TAIL MANAGEMENT METHODS *****
// These methods make sure the tail is the correct length.
//*

void drawTail() {
  //Draw each segment of the tail 
for(Segment s: tail){
  square(s.x, s.y, 10);
  
}
}
void manageTail() {
checkTailCollision();
drawTail();
tail.add(new Segment(head.x, head.y));
tail.remove(0);
  //After drawing the tail, add a new segment at the "start" of the tail and remove the one at the "end" 
  //This produces the illusion of the snake tail moving.
  
}

void checkTailCollision() {
  //If the snake crosses its own tail, shrink the tail back to one segment
  for(Segment s: tail){
    if(head.x == s.x && head.y == s.y){
      tail=new ArrayList<Segment>();
     // tail.add(new Segment(head.x,head.y));
     break; 
  }
  
}
}



//*
// ***** CONTROL METHODS *****
// These methods are used to change what is happening to the snake
//*

void keyPressed() {
  //Set the direction of the snake according to the arrow keys pressed
if(key == CODED){
  if(keyCode == UP && snakeDir != DOWN){
  snakeDir = UP;
  }if(keyCode == DOWN && snakeDir != UP){
    snakeDir = DOWN;
  }if(keyCode == RIGHT && snakeDir != LEFT){
   snakeDir = RIGHT; 
  }if(keyCode == LEFT && snakeDir != RIGHT){
  snakeDir = LEFT;
  }

}
}
                      
void move() {
  //Change the location of the Snake head based on the direction it is moving.
  
    
  switch(snakeDir) {
    case UP:
    head.y = head.y - 10;
    break;
  case DOWN:
    head.y = head.y + 10;
    break;
  case LEFT:
   head.x = head.x- 10;
    break;
  case RIGHT:
    head.x = head.x + 10;
    break;
  }
  checkBoundaries();
}

void checkBoundaries() {
 //If the snake leaves the frame, make it reappear on the other side
 if(head.x < 0){
 head.x = width-10;
 }if(head.y < 0){
 head.y = height-10;
 }if(head.x > width){
head.x = -10;
 }if(head.y > height){
  head.y = -10; 
}
}



void eat() {
  //When the snake eats the food, its tail should grow and more food appear
  if(head.x == foodx && head.y == foody){
    dropFood();
  foodEaten = foodEaten + 1;  
  tail.add(new Segment(head.x, head.y));
}
}
