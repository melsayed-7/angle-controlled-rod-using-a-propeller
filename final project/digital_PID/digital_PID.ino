#include<Servo.h>           //Include The servo library for the functions used

Servo esc;                  //Declare the ESC as a Servo Object
// the PID factors
float KP= 15.60977;
float KI= 48.2337;
float KD= 0;

float error = 1;
float memory_error= 0;

float int_error=0;
float diff_error=0;

float controller=0;//controller signal

float Ts=.01;
float goal=15;



unsigned long T1;
unsigned long T2;

float init_angle;
float angle;

void setup() {
  // put your setup code here, to run once:

esc.attach(9);           //Attach the ESC to Digital Pin 10
Serial.begin(9600);      //Begin Reading/Open Serial Monitor
init_angle=analogRead(A1);           //the reading of the potentiometer on the bodey
/*
esc.write(180);                          //calibrate the ESC
delay(2);
esc.write(00);
*/
}

void loop() {
   
  //PID digital PID
  
T1 = micros();//
    /*
    current_angle=analogRead(A1)- init_angle;    
    current_angle=map(current_angle,0,1203,0,40);
    */
     Serial.print("angle read:");
     angle=(init_angle-analogRead(A1));                      //Value of input is analog input on pin A1 (on the bodey)
     angle=map(angle,0.0,164.0,0.0,37.476);
     Serial.print(angle);     
     Serial.print(" | ");
     
      error= goal - angle;
      int_error += error*Ts ;
      diff_error= (error-memory_error)/Ts;
      memory_error=diff_error;
      
      controller = error*KP + KI*int_error +  diff_error*KD;
      
      Serial.print("controller signal:");      //Serial print the original input value
      Serial.print(controller);
      Serial.print(" | ");
      
     Serial.print("\n");
    
    esc.writeMicroseconds(controller);                          //The state of ESC will be the same as the state/position of Joystick
  
    T2=micros();
    Ts=(T2-T1)/1000000.0;

}
