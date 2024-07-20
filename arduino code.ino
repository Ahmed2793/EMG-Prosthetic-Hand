// this code is only customized to work on my fingers' emg signal 
// the code will need customization for each person
#include <Servo.h>
// Create servo objects for the 5 servos
Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;
Servo servo5;

void setup() {
  Serial.begin(9600);
  servo1.attach(2);
  servo2.attach(3);
  servo3.attach(4);
  servo4.attach(5);
  servo5.attach(6);

  servo1.write(180);
  servo2.write(180);
  servo3.write(180);
  servo4.write(0);
  servo5.write(0);

  // Optional: Add a delay to allow the servos to reach the starting position
  delay(1000);
}

void loop() {
  if (Serial.available() > 0) {
    String data = Serial.readStringUntil('\n');
    Serial.println(data);  // Echo the received data

    // Convert the received data to a float
    float value = data.toFloat();

    if (value > 3.0 & value < 3.5) {
      servo2.write(0);
      delay(1000);
    } else if (value > 2.0 & value < 2.5) {
      servo5.write(180);
      delay(1000);
    } else if (value > 1.6 & value < 2.0) {
      servo4.write(135);
      delay(1000);
    } else if (value > 2.5 & value < 3.0) {
      servo3.write(40);
      delay(1000);
    } else if (value > 1.45 & value < 1.6) {
      servo1.write(40);
      delay(1000);
    } else if (value > 3.5) {
      servo1.write(40);
      servo2.write(0);
      servo3.write(40);
      servo4.write(135);
      servo5.write(180);
      delay(2000);
    } else {
     servo1.write(180);
  servo2.write(180);
  servo3.write(180);
  servo4.write(0);
  servo5.write(0);
  delay(20);
    }

  } else {
    servo1.write(180);
  servo2.write(180);
  servo3.write(180);
  servo4.write(0);
  servo5.write(0);
  delay(20);
  }
}
