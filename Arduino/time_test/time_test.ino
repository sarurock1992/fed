unsigned long time;

void setup() {
  Serial.begin(9600);
}

void loop() {
  time = millis();
  Serial.println(time);

  delay(1); // 1秒おきに送信
}
