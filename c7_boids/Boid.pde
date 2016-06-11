// The Boid class
class Boid 
{
  PVector loc;
  PVector vel;
  PVector acc;
  float r; // radius size of the being
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed
  int frame = 0;

  Boid(PVector l, float ms, float mf) 
  {
    acc = new PVector(0,0);

    // initial moving direction
   // vel = new PVector(random(-1,1),random(-1,1));
    vel = new PVector(0, -1);

    loc = l.get();
    r = 15;
    maxspeed = ms;
    maxforce = mf;
  }

  void run(ArrayList boids) 
  {
    flock(boids);
    update();
    borders();
    render();

    /* for (int i = 0 ; i < boids.size(); i++)
     {
     Boid b = (Boid) boids.get(i);
     print("Boid "+i+"["+b.loc.x + " "+ b.loc.y+"]\n");
     }*/
  }

  // We accumulate a new acceleration each time based on three rules
  void flock(ArrayList boids) 
  {
    PVector sep = separate(boids);   // Separation
    PVector ali = align(boids);      // Alignment
    PVector coh = cohesion(boids);   // Cohesion

    // Arbitrarily weight these forces
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);

    // Add the force vectors to acceleration
    acc.add(sep);
    acc.add(ali);
    acc.add(coh);
  }

  // Method to update location
  void update()
  {
    // Update velocity
    vel.add(acc);
    // Limit speed
    vel.limit(maxspeed);
    loc.add(vel);
    // Reset accelertion to 0 each cycle
    acc.mult(0);
  }

  void seek(PVector target)
  {
    acc.add(steer(target,false));
  }

  void arrive(PVector target) 
  {
    acc.add(steer(target,true));
  }

  // A method that calculates a steering vector towards a target
  // Takes a second argument, if true, it slows down as it approaches the target
  PVector steer(PVector target, boolean slowdown) 
  {
    PVector steer;  // The steering vector
    PVector desired = target.sub(target,loc);  // A vector pointing from the location to the target
    float d = desired.mag(); // Distance from the target is the magnitude of the vector

    // If the distance is greater than 0, calc steering (otherwise return zero vector)
    if (d > 0) 
    {
      // Normalize desired
      desired.normalize();
      // Two options for desired vector magnitude (1 -- based on distance, 2 -- maxspeed)
      if ((slowdown) && (d < 100.0)) desired.mult(maxspeed*(d/100.0)); // This damping is somewhat arbitrary
      else desired.mult(maxspeed);
      // Steering = Desired minus Velocity
      steer = target.sub(desired,vel);
      steer.limit(maxforce);  // Limit to maximum steering force
    } 
    else 
    {
      steer = new PVector(0,0);
    }
    return steer;
  }

  void render() 
  {
    // Draw a triangle rotated in the direction of velocity
    if(show_boid_border == 1){stroke(255,0,0);}else{noStroke();}
    float theta = vel.heading2D() + PI/2;
    frame = (frame+1) % frames_number;
    pushMatrix();
    translate(loc.x, loc.y);
    rotate(theta);
    textureMode(NORMAL);
    beginShape();
    texture(ant[frame]);
     vertex(-r, -r*0.9, 1,0);
     vertex(r, -r*0.9,0,0);
     vertex(r, r*0.9,0,1);
     vertex(-r, r*0.9,1,1);
    endShape(CLOSE);
    popMatrix();  
  }

  // Wraparound
  void borders() 
  {
    // pass thru mode
    if(border_mode == 0)
    {
      // detect left border
      if (loc.x-(r/2) < ((width/2)-(box_width/2))) loc.x = ((width/2)+(box_width/2))-(r/2);
      // detect top border
      if (loc.y-(r/2) < ((height/2)-(box_height/2))) loc.y = ((height/2)+(box_height/2))-(r/2);
      // detect right border
      if (loc.x+(r/2) > ((width/2)+(box_width/2))) loc.x = ((width/2)-(box_width/2))+(r/2);
      // detect bottom border
      if (loc.y+(r/2) > ((height/2)+(box_height/2))) loc.y = ((height/2)-(box_height/2))+(r/2);
    }
    // bouce back mode
    else
    {
      // detect left border
      if (loc.x-(r/2) < ((width/2)-(box_width/2))){
        loc.x=((width/2)-(box_width/2))+(r/2); 
        vel.x = -vel.x * random(0.9, 1.1);
      }
      // detect top border
      if (loc.y-(r/2) < ((height/2)-(box_height/2))){
        loc.y=((height/2)-(box_height/2))+(r/2); 
        vel.y = -vel.y * random(0.9, 1.1);
      }
      // detect right border
      if (loc.x+(r/2) > ((width/2)+(box_width/2))){
        loc.x=((width/2)+(box_width/2))-(r/2); 
        vel.x = -vel.x * random(0.9, 1.1);
      }
      // detect bottom border
      if (loc.y+(r/2) > ((height/2)+(box_height/2))){
        loc.y=((height/2)+(box_height/2))-(r/2); 
        vel.y = -vel.y * random(0.9, 1.1);
      }
    }
  }

  // Separation
  // Method checks for nearby boids and steers away
  PVector separate (ArrayList boids) 
  {
    float desiredseparation = r*3;
    PVector steer = new PVector(0,0,0);
    int count = 0;

    // For every boid in the system, check if it's too close
    for (int i = 0 ; i < boids.size(); i++)
    {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);

      // If the distance is greater than 0 and less than an arbitrary amount (0 when you are yourself)
      if ((d > 0) && (d < desiredseparation)) 
      {
        // Calculate vector pointing away from neighbor
        PVector diff = PVector.sub(loc,other.loc);
        diff.normalize();
        diff.div(d);        // Weight by distance
        steer.add(diff);
        count++;            // Keep track of how many
      }
    }
    // Average -- divide by how many
    if (count > 0) 
    {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) 
    {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Alignment
  // For every nearby boid in the system, calculate the average velocity
  PVector align (ArrayList boids)
  {
    float neighbordist = r*4;
    PVector steer = new PVector(0,0,0);
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) 
    {
      Boid other = (Boid) boids.get(i);
      float d = PVector.dist(loc,other.loc);
      if ((d > 0) && (d < neighbordist))
      {
        steer.add(other.vel);
        count++;
      }
    }
    if (count > 0) 
    {
      steer.div((float)count);
    }

    // As long as the vector is greater than 0
    if (steer.mag() > 0) 
    {
      // Implement Reynolds: Steering = Desired - Velocity
      steer.normalize();
      steer.mult(maxspeed);
      steer.sub(vel);
      steer.limit(maxforce);
    }
    return steer;
  }

  // Cohesion
  // For the average location (i.e. center) of all nearby boids, calculate steering vector towards that location
  PVector cohesion (ArrayList boids) 
  {
    float neighbordist = r*4;
    PVector sum = new PVector(0,0);   // Start with empty vector to accumulate all locations
    int count = 0;
    for (int i = 0 ; i < boids.size(); i++) 
    {
      Boid other = (Boid) boids.get(i);
      float d = loc.dist(other.loc);
      if ((d > 0) && (d < neighbordist)) 
      {
        sum.add(other.loc); // Add location
        count++;
      }
    }
    if (count > 0)
    {
      sum.div((float)count);
      return steer(sum, false);  // Steer towards the location
    }
    return sum;
  }
}