import java.awt.Rectangle;
import java.awt.Polygon;

ArrayList<GameObject> objects = new ArrayList<GameObject>(); 

BigStar stars;
Menu menu;
Asteroids asteroid;
Stars[] Stars = new Stars[20];
SmallStars[] SmallStars = new SmallStars[35];

boolean isMainMenu = true;
int selected = 0;
int gamemode;
int size;
int level;

void setup()
{

  size(700, 600);
  //   objects.add(new Player(100, 250, 0)); 
  //   objects.add(new Player(600, 250, 1)); 
  //  objects.add(new Stars()); 
  //  objects.add(new BigStar()); 
  objects.add(menu = new Menu());


  for (int i = 0; i < Stars.length; i++) {
    Stars[i] = new Stars(i*50, 150, 2, 2);
  }

  for (int i = 0; i < SmallStars.length; i++) {
    SmallStars[i] = new SmallStars(i*50, -150, 1, 1);
  }
}

void draw()
{

  background(0);

  for (int i = 0; i < Stars.length; i++) {
    Stars[i].displaystars();
  }

  for (int i = 0; i < SmallStars.length; i++) {
    SmallStars[i].displaystars();
  }

  //draw arraylists using loop
  for (int i = 0; i < objects.size (); i ++)
  {    

    objects.get(i).move();
    objects.get(i).display();  

    if (! objects.get(i).alive)
    {
      print("removed");
      objects.remove(i);
      size -=1;
    }
  }

  // Check for collisions
  for (int i = 0; i < objects.size (); i++) {
    for (int a = 0; a < objects.size (); a++) {
        if(objects.get(i).checkCollision(objects.get(a)))
        objects.get(i).collide(objects.get(a));
    }
  }
}

