Spaceship bob;
ArrayList <Asteroid> rock;
ArrayList <Bullet> bang;
Star[] shine = new Star[150];
boolean wIsPressed = false;
boolean dIsPressed = false;
boolean aIsPressed = false;
boolean qIsPressed = false;


public void setup() 
{
  background(0);
  size(600,600);
  bob = new Spaceship();
  for(int i = 0; i < shine.length; i++){
    shine[i] = new Star();
  }
  bang = new ArrayList <Bullet> ();
  rock = new ArrayList <Asteroid> ();
  for(int i = 0; i < 15; i++){
    rock.add(new Asteroid());
  }
}

public void draw() 
{  
  fill(0);
  rect(0,0,600,600);
  for(int i = 0; i < shine.length; i++){
      shine[i].show();
    }
    for(int i = 0; i < rock.size(); i++){
      rock.get(i).show();
      rock.get(i).move();

    }
  
  bob.show();
  bob.move();
  if(wIsPressed == true){
    bob.accelerate(0.05);
  }
  if(aIsPressed == true){
    bob.turn(-2);
  }
  if(dIsPressed == true){
    bob.turn(2);
  }
  if(wIsPressed == true && aIsPressed == true){
    bob.accelerate(0.05);
    bob.turn(-3);
  }
  if(wIsPressed == true && dIsPressed == true){
    bob.accelerate(0.05);
    bob.turn(3);
  }
  for(int i = 0; i < bang.size(); i++){
    bang.get(i).show();
    bang.get(i).move();

  }

  for(int j = 0; j < rock.size(); j++){
    for(int i = 0; i < bang.size(); i++){
      if(dist(rock.get(j).getX(), rock.get(j).getY(),bang.get(i).getX(), bang.get(i).getY() ) < 18){
          rock.remove(j);
          bang.remove(i);  
            break;
        }
    }
  }
  fill(255);
  textSize(20);
  textAlign(CENTER);

}

public void keyPressed(){
  if(key == 'w'){
    wIsPressed = true;
  }
  if(key == 'd'){
    dIsPressed = true;
  }
  if(key == 'a'){
    aIsPressed = true;
  }
  if(key == 'e'){
    bob.hyperspace();
  }
  if(key == ' '){
    bang.add(new Bullet(bob));
  }


}

public void keyReleased(){
  if(key == 'w'){
    wIsPressed = false;
  }
  if(key == 'd'){
    dIsPressed = false;
  }
  if(key == 'a'){
    aIsPressed = false;
  }
  if(key == 'q'){
    qIsPressed = false;
  }
}
