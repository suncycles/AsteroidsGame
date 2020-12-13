Spaceship bob;
ArrayList <Asteroid> rock;
ArrayList <Bullet> bullet;
Star[] star = new Star[150];
boolean wIsPressed = false;
boolean dIsPressed = false;
boolean aIsPressed = false;

public void setup() 
{
  background(0);
  size(600,600);
  bob = new Spaceship();
  for(int i = 0; i < star.length; i++){
    star[i] = new Star();
  }
  bullet = new ArrayList <Bullet> ();
  rock = new ArrayList <Asteroid> ();
  for(int i = 0; i < 15; i++){
    rock.add(new Asteroid());
  }
}

public void draw() 
{  
  fill(0);
  rect(0,0,600,600);
  for(int i = 0; i < star.length; i++){
      star[i].show();
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
  for(int i = 0; i < bullet.size(); i++){
    bullet.get(i).show();
    bullet.get(i).move();

  }

  for(int j = 0; j < rock.size(); j++){
    for(int i = 0; i < bullet.size(); i++){
      if(dist(rock.get(j).getX(), rock.get(j).getY(),bullet.get(i).getX(), bullet.get(i).getY() ) < 18){
          rock.remove(j);
          bullet.remove(i);  
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
    bullet.add(new Bullet(bob));
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
}
