
// the PID factors
float KP= 0.0073633;
float KI= 0.27923;
float KD= 0;

float error = 1;
float memory_error= 0;

float int_error;
float diff_error;

float controller=0;

float Ts=.002;
float goal=20;

int current_angle;

unsigned long T1;
unsigned long T2;

int init_angle;

void setup() {
  // put your setup code here, to run once:

esc.attach(9);           //Attach the ESC to Digital Pin 10
Serial.begin(9600);      //Begin Reading/Open Serial Monitor
initangle=analogRead(A1);           //the reading of the potentiometer on the bodey

esc.write(180);                          //calibrate the ESC
delay(2);
esc.write(00);
}

void loop() {
   
  //PID digital PID
  
T1 = micros();//
    
    current_angle=analogRead(A1)- init_angle;    
    current_angle=map(current_angle,0,1203,0,40);
    error= goal - current_angle;
    int_error += error*Ts ;
    diff_error= (error-memory_error)/Ts;
    memory_error=diff_error;
    controller = error*KP + KI*int_error +  diff_error*KD;
    
    Serial.print("controller signal:");      //Serial print the original input value
    Serial.print(controller);
    Serial.print(" | ");
    
    input=map(controller, 0, 1, 0, 180); //Map the input values from the joystick on analog pin 0 to  correspond to max and min values for the servo output: 180 and 0
     Serial.print("Mapped Input Value:");
     Serial.print(input);                      //Serial print the mapped input value
     Serial.print(" | ");
     Serial.print("angle read:");
     angle=analogRead(A1);                      //Value of input is analog input on pin A1 (on the bodey)
     Serial.print(-angle+initangle);     
     Serial.print("\n");
    delay(1);                                  //Delay determines your resolution/smoothness and responsiveness of Motor to the movement of Potwntiometer/Joystick.
    esc.write(input);                          //The state of ESC will be the same as the state/position of Joystick
    
        T2=micros();
        Ts=(T2-T1)/1000000.0;

}
