import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;


float analog1;
AudioSample bassSample;
AudioSample bassSample2;
AudioSample snareSample;
AudioSample snareSample2;

Minim minim;


void setup(){
 size(500, 500);
    println(Arduino.list()); 
    arduino = new Arduino(this, Arduino.list()[0], 57600); // CHANGE ARRAY INDEX TO MATCH PORT NUMBER
    
    
     minim = new Minim(this);
  bassSample = minim.loadSample("bassM3_edit.mp3");
  bassSample2 = minim.loadSample("SoftBassdrum.mp3"); 
  snareSample = minim.loadSample("Snaredrum5.mp3");
  snareSample2 = minim.loadSample("Snaredrum7.mp3"); 
   
}

  


void draw(){
 background(0);
 
  fill(143,224,247); 
  for (int i = 0; i <= 3; i++) {
    ellipse(130 + i * 80, 240, arduino.analogRead(1) / 2, arduino.analogRead(1) / 2);
  if (arduino.analogRead(1)>=30){
   bassSample.trigger(); 
  }
  } 
   
 
  fill(255,163,208);
  for (int i = 0; i <= 3; i++) {
    ellipse(250,130 + i * 80, arduino.analogRead(2) / 2, arduino.analogRead(2) / 2);  
if (arduino.analogRead(2)>=30){
   bassSample2.trigger(); 
  }
  }
  
  
  fill(68,209,83);
     for (int i = 3; i <= 3; i++) {
    ellipse(250, 240, arduino.analogRead(3) / 2, arduino.analogRead(3) / 2); 
    if (arduino.analogRead(3)>=30){
   snareSample.trigger(); 
  }
  }
 
  
  fill(253,239,159);
     for (int i = 0; i <= 3; i++) {
    ellipse(130 + i * 80, 240, arduino.analogRead(4) / 2, arduino.analogRead(4) / 2); 
     if (arduino.analogRead(4)>=30){
   snareSample2.trigger(); 
  }
  }
}


void stop()
{
  // always close Minim audio classes when you are done with them
  bassSample.close();
  bassSample2.close();
  snareSample.close();
  snareSample2.close();
  minim.stop();
  
  super.stop();
}


