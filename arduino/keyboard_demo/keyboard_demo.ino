#include <Keyboard.h>

/*
const int ZOOMIN = 7; //111
const int ZOOMOUT = 6; //110
const int SCROLLUP = 5; //101
const int SCROLLDOWN = 4; //100
const int TABFWD = 3; //011
const int TABREV = 2; //010
*/

const int ACK = 3;

void setup() {
  // put your setup code here, to run once:
  pinMode(7, INPUT);
  pinMode(6, INPUT);
  pinMode(5, INPUT);
  pinMode(ACK, OUTPUT);
  Keyboard.begin();
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:

  int in[3];
  in[0] = digitalRead(5);
  in[1] = digitalRead(6);
  in[2] = digitalRead(7);
  delay(20);
  
  while (!(in[0] == 1 || in[1] == 1 || in[2] == 1))
  {
    digitalWrite(ACK, LOW); //spin
    in[0] = digitalRead(5);
    in[1] = digitalRead(6);
    in[2] = digitalRead(7);
    delay(20);
  }

  //Serial.print(in[2]); Serial.print(in[1]); Serial.println(in[0]);
 
  /*while (digitalRead(ZOOMIN) == 0) {
    delay(100);
  }*/
  
  if (in[2] == 0 && in[1] == 0 && in[0] == 1) {
    Keyboard.press(214); //pgdwn
    Serial.println("pgdwn");
    //Keyboard.press(217); //down arrow 
  }
  if (in[2] == 0 && in[1] == 1 && in[0] == 0) {
    Keyboard.press(211); //pgup
    Serial.println("pgup");
    //Keyboard.press(218); //up arrow
  }
  if (in[2] == 0 && in[1] == 1 && in[0] == 1) {
    //Keyboard.press(128); //ctrl
    Keyboard.press(130); //alt
    Keyboard.press(179); //tab
    Serial.println("alt tab");
  }
  if (in[2] == 1 && in[1] == 0 && in[0] == 0) {
    //Keyboard.press(128); //ctrl
    /*
    Keyboard.press(130); //alt
    Keyboard.press(129); //shift
    Keyboard.press(179); //tab
    delay(5);
    Keyboard.press(130); //alt
    Keyboard.press(129); //shift
    Keyboard.press(179); //tab*/
    Serial.println("alt shift tab");
  }
  if (in[2] == 1 && in[1] == 0 && in[0] == 1) {
    Keyboard.press(128); //ctrl
    Keyboard.press('=');
    Serial.println("zoom in");
  }
  if (in[2] == 1 && in[1] == 1 && in[0] == 0) {
    Keyboard.press(128); //ctrl
    Keyboard.press('-');
    Serial.println("zoom out");
  }
  
  Keyboard.releaseAll();
  digitalWrite(ACK, HIGH);
  delay(250);
}
