
#include<Servo.h>           //Include The servo library for the functions used

Servo esc;                  //Declare the ESC as a Servo Object
int input;

int angle;
int initangle;

void setup() 
{
esc.attach(9,0,1023);           //Attach the ESC to Digital Pin 10
 Serial.begin(9600);      //Begin Reading/Open Serial Monitor
initangle=analogRead(A1);                      //Value of input is analog input on pin A1

/*
esc.write(180);                          //The state of ESC will be the same as the state/position of Joystick   -2
delay(2);
esc.write(00);    
*/
}

void loop() 
{ 
  input=analogRead(A0);                      //Value of input is analog input on pin A0 (the controlling potentiometer)
  
//input=map(analogRead(A0), 0, 1023, 0, 180); //Map the input values from the joystick on analog pin 0 to  correspond to max and min values for the servo output: 180 and 0
 Serial.print(input);                      //Serial print the mapped input value
 Serial.print(",");
 angle=analogRead(A1);                      //Value of input is analog input on pin A1 (on the bodey)
 Serial.print(-angle+initangle);     
 Serial.print("\n");
delay(1);                                  //Delay determines your resolution/smoothness and responsiveness of Motor to the movement of Potwntiometer/Joystick.
esc.write(input);                          //The state of ESC will be the same as the state/position of Joystick

}
