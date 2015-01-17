class Asteroids extends GameObject
{
  float w, h;

  float timeDelta = 1.0f / 60.0f;

  float fireRate = 10.0f;
  float ellapsed = 0.0f;
  float toPass = 15.0f / fireRate;
  
  float radius;
  float points;

  PVector accel = new PVector();//ship's acceleration
  PVector velocity = new PVector();//ship's speeds

  int playerIndex = 0;

  Asteroids(float x, float y, float radius, float points)
  {
    position.x = x;
    position.y = y;
    this.radius = radius;
    this.points = points;
    this.theta = 0;
  }
  
  Asteroids()
  {
    this(random(0,width), random(0,height), 50, 5);
  }


  void display()
  {

    getBounds(); //display the boundaries of the polygon
    float areaP;
    float px, py;
    float lastx = 0, lasty = -radius;
    float theta1 = 0;
    float thetaInc = TWO_PI / (points * 2);
    
    velocity.set(random(2,5), random(2,5)); // set the velocity
    
    //velocity.add(accel);
    position.add(velocity);
    
    pushMatrix();

    translate(position.x, position.y);   
    rotate(theta);

    stroke(colour);
    float halfWidth = w / 2;
    float  halfHeight = h / 2;

    fill(0, 255, 200);
    stroke(0, 255, 200);

    
     for(int i = 0 ; i < (points * 2) ; i ++)
    {
      theta1 += thetaInc;
      if (i % 2 == 1)
      {
        px = sin(theta1) * radius;
        py = -cos(theta1) * radius;
      }
      else
      {
        px = sin(theta1) * (radius * 0.8f);
        py = -cos(theta1) * (radius * 0.8f);
      }
      line(lastx, lasty, px, py);
      lastx = px;
      lasty = py;
      
      
    }
    
    popMatrix();
  }

  void getBounds(){
   
   stroke(255, 255, 0);
   noFill();
   rect(position.x - radius, position.y - radius, radius * 2, radius * 2);
    
  }

  void move()
  {
    
    theta += 0.01;
    
    accel.set(0, 0, 0); // cuase drag to slow ship down
  //  accel = 1;
    float totalAccel = 0.2;             // how much ship accelerates
    accel.x = random(0, 0.200);  
    accel.y = random(0, 0.200);
    
    // off screen loop
    if (position.x < 0)
    {
      position.x = width;
    }
    if (position.x > width)
    {
      position.x = 0;
    }
    if (position.y > height)
    {
      position.y = 0;
    }
    if (position.y < 0)
    {
      position.y = height;
    }

    ellapsed += timeDelta;
    float lx, ly;
    lx = sin(theta);
    ly = -cos(theta);
  }
}
