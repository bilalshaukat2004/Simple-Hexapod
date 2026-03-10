#include <Wire.h>
#include <Adafruit_PWMServoDriver.h>

Adafruit_PWMServoDriver left(0x40,Wire);
Adafruit_PWMServoDriver right(0x40,Wire1);
const int step_delay = 800;


void setup() {
  Serial.begin(115200);
  Wire.begin(8, 9);
  Wire1.begin(20, 21);
  left.begin();
  right.begin();
  left.setPWMFreq(50);
  right.setPWMFreq(50);
  delay(1000);
  
  Serial.println("Starting sequence...");
  
  // 1. GROUND position
  
  // 2. STANDING position
  Serial.println("2. Setting STANDING position");
  setStand();
  delay(3000);

  // 3. Back to GROUND
  
  Serial.println("Done!");
}

void setGround() {
  // Leg flat on ground
  left.writeMicroseconds(0, map(90, 0, 180, 500, 2500));  // Leg1 Coxa
  left.writeMicroseconds(1, map(90, 0, 180, 500, 2500));  // Leg1 Femur
  left.writeMicroseconds(2, map(90, 0, 180, 500, 2500));  // Leg1 Tibia
  left.writeMicroseconds(3, map(90, 0, 180, 500, 2500));  // Leg2 Coxa
  left.writeMicroseconds(4, map(90, 0, 180, 500, 2500));  // Leg2 Femur
  left.writeMicroseconds(5, map(90, 0, 180, 500, 2500));  // Leg2 Tibia
  left.writeMicroseconds(6, map(90, 0, 180, 500, 2500));  // Leg3 Coxa
  left.writeMicroseconds(7, map(90, 0, 180, 500, 2500));  // Leg3 Femur
  left.writeMicroseconds(8, map(90, 0, 180, 500, 2500));  // Leg3 Tibia

  right.writeMicroseconds(0, map(90, 0, 180, 500, 2500));  // Leg4 Coxa
  right.writeMicroseconds(1, map(90, 0, 180, 500, 2500));  // Leg4 Femur
  right.writeMicroseconds(2, map(90, 0, 180, 500, 2500));  // Leg4 Tibia
  right.writeMicroseconds(3, map(90, 0, 180, 500, 2500));  // Leg5 Coxa
  right.writeMicroseconds(4, map(90, 0, 180, 500, 2500));  // Leg5 Femur
  right.writeMicroseconds(15, map(90, 0, 180, 500, 2500));  // Leg5 Tibia
  right.writeMicroseconds(6, map(90, 0, 180, 500, 2500));  // Leg6 Coxa
  right.writeMicroseconds(7, map(90, 0, 180, 500, 2500));  // Leg6 Femur
  right.writeMicroseconds(8, map(90, 0, 180, 500, 2500));  // Leg6 Tibia

}

void setStand() {
  // Leg in standing position
  left.writeMicroseconds(0, map(90, 0, 180, 500, 2500));
  left.writeMicroseconds(1, map(50, 0, 180, 500, 2500));
  left.writeMicroseconds(2, map(145, 0, 180, 500, 2500));
  left.writeMicroseconds(3, map(90, 0, 180, 500, 2500));
  left.writeMicroseconds(4, map(50, 0, 180, 500, 2500));
  left.writeMicroseconds(5, map(145, 0, 180, 500, 2500));
  left.writeMicroseconds(6, map(90, 0, 180, 500, 2500));
  left.writeMicroseconds(7, map(50, 0, 180, 500, 2500));
  left.writeMicroseconds(8, map(145, 0, 180, 500, 2500));

  right.writeMicroseconds(0, map(90, 0, 180, 500, 2500));
  right.writeMicroseconds(1, map(50, 0, 180, 500, 2500));
  right.writeMicroseconds(2, map(145, 0, 180, 500, 2500));
  right.writeMicroseconds(3, map(90, 0, 180, 500, 2500));
  right.writeMicroseconds(4, map(50, 0, 180, 500, 2500));
  right.writeMicroseconds(15, map(148, 0, 180, 500, 2500));
  right.writeMicroseconds(6, map(90, 0, 180, 500, 2500));
  right.writeMicroseconds(7, map(50, 0, 180, 500, 2500));
  right.writeMicroseconds(8, map(145, 0, 180, 500, 2500));
}

void Walk()
{
  left.writeMicroseconds(2, map(145, 0, 180, 500, 2500));
  left.writeMicroseconds(5, map(155, 0, 180, 500, 2500));
  left.writeMicroseconds(8, map(145, 0, 180, 500, 2500));
  right.writeMicroseconds(2, map(145, 0, 180, 500, 2500));
  right.writeMicroseconds(15, map(148, 0, 180, 500, 2500));
  right.writeMicroseconds(8, map(145, 0, 180, 500, 2500));

  left.writeMicroseconds(1, map(120, 0, 180, 500, 2500));
  left.writeMicroseconds(7, map(120, 0, 180, 500, 2500));
  right.writeMicroseconds(4, map(120, 0, 180, 500, 2500));
  delay(step_delay);

  left.writeMicroseconds(0, map(45, 0, 180, 500, 2500));
  left.writeMicroseconds(6, map(45, 0, 180, 500, 2500));
  right.writeMicroseconds(3, map(135, 0, 180, 500, 2500));
  delay(step_delay);

  left.writeMicroseconds(1, map(60, 0, 180, 500, 2500));
  left.writeMicroseconds(7, map(60, 0, 180, 500, 2500));
  right.writeMicroseconds(4, map(60, 0, 180, 500, 2500));
  delay(step_delay);

  left.writeMicroseconds(0, map(90, 0, 180, 500, 2500));
  left.writeMicroseconds(6, map(90, 0, 180, 500, 2500));
  right.writeMicroseconds(3, map(90, 0, 180, 500, 2500));
  delay(step_delay);

  right.writeMicroseconds(1, map(120, 0, 180, 500, 2500));
  right.writeMicroseconds(7, map(120, 0, 180, 500, 2500));
  left.writeMicroseconds(4, map(120, 0, 180, 500, 2500));
  delay(step_delay);

  right.writeMicroseconds(0, map(135, 0, 180, 500, 2500));
  right.writeMicroseconds(6, map(135, 0, 180, 500, 2500));
  left.writeMicroseconds(3, map(45, 0, 180, 500, 2500));
  delay(step_delay);

  right.writeMicroseconds(1, map(60, 0, 180, 500, 2500));
  right.writeMicroseconds(7, map(60, 0, 180, 500, 2500));
  left.writeMicroseconds(4, map(60, 0, 180, 500, 2500));
  delay(step_delay);

  right.writeMicroseconds(0, map(90, 0, 180, 500, 2500));
  right.writeMicroseconds(6, map(90, 0, 180, 500, 2500));
  left.writeMicroseconds(3, map(90, 0, 180, 500, 2500));
  delay(step_delay);
}

void loop() {
  Walk();
}