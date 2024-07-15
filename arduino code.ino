#include <Servo.h>
Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;
Servo servo5;

const int servoPin1 = 8;
const int servoPin2 = 9;
const int servoPin3 = 10;
const int servoPin4 = 11;
const int servoPin5 = 12;
void setup() {
  Serial.begin(9600);
  servo1.attach(servoPin1);
  servo2.attach(servoPin2);
  servo3.attach(servoPin3);
  servo4.attach(servoPin4);
  servo5.attach(servoPin5);
}

void loop() {
  if (Serial.available() > 0) {
    String data = Serial.readStringUntil('\n');
    Serial.println(data);  // Echo the received data

    // Convert the received data to a float
    float value = data.toFloat() / 1000.0;

    // Check if the value is greater than 2
    if (value > 3.0) {
     servo1.write(90);
     servo2.write(90);
     servo3.write(90);
     servo4.write(90);
     servo5.write(90);
  delay(1000); // wait for a second

    } else {
       servo1.write(0);
     servo2.write(0);
     servo3.write(0);
     servo4.write(0);
     servo5.write(0);
    }
  }
}
