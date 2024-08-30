#include <Servo.h>

// Create servo objects for the 5 servos
Servo servo1;
Servo servo2;
Servo servo3;
Servo servo4;
Servo servo5;

void setup() {
  // Attach the servos to their respective pins
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
  servo2.write(0);
  delay(1000);
  servo2.write(180);
  delay(1000);
  servo2.write(0);
  delay(1000);
  servo2.write(180);
  delay(1000);
  servo2.write(0);
  delay(1000);
  servo2.write(180);
  delay(1000);

  servo4.write(135);
  delay(1000);
  servo4.write(0);
  delay(1000);
  servo4.write(135);
  delay(1000);
  servo4.write(0);
  delay(1000);
  servo4.write(135);
  delay(1000);
  servo4.write(0);
  delay(1000);

   servo5.write(180);
  delay(1000);
  servo5.write(0);
  delay(1000);
  servo5.write(180);
  delay(1000);
  servo5.write(0);
  delay(1000);
  servo5.write(180);
  delay(1000);
  servo5.write(0);
  delay(1000);
  
  servo3.write(40);
  delay(1000);
  servo3.write(180);
  delay(1000);
  servo3.write(40);
  delay(1000);
  servo3.write(180);
  delay(1000);
  servo3.write(40);
  delay(1000);
  servo3.write(180);
  delay(1000);

   servo1.write(40);
  delay(1000);
  servo1.write(180);
  delay(1000);
  servo1.write(40);
  delay(1000);
  servo1.write(180);
  delay(1000);
  servo1.write(40);
  delay(1000);
  servo1.write(180);
  delay(1000);
  // Example: Move each servo to 90 degrees, then back to 0 degrees
  servo1.write(40);
  servo2.write(0);
  servo3.write(40);
  servo4.write(135);
  servo5.write(180);
  delay(1000);
  servo1.write(40);
  servo2.write(180);
  servo3.write(40);
  servo4.write(135);
  servo5.write(180);
  delay(1000);
  servo1.write(40);
  servo2.write(180);
  servo3.write(40);
  servo4.write(0);
  servo5.write(180);
  delay(1000);
  servo1.write(40);
  servo2.write(180);
  servo3.write(40);
  servo4.write(0);
  servo5.write(0);
  delay(1000);
  servo1.write(40);
  servo2.write(180);
  servo3.write(180);
  servo4.write(0);
  servo5.write(0);
  delay(1000);
  servo1.write(180);
  servo2.write(180);
  servo3.write(180);
  servo4.write(0);
  servo5.write(0);
  delay(1000);



  delay(1000);
  // Optional: Add a delay between cycles
}
